import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:package_info_plus/package_info_plus.dart';
import 'package:taxi_app/blocs/address_bloc/address_bloc.dart';
import 'package:taxi_app/blocs/create_order/create_order_bloc.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/request_bloc.dart';
import 'package:taxi_app/blocs/location_bloc/location_bloc.dart';
import 'package:taxi_app/blocs/messages/message_bloc.dart';
import 'package:taxi_app/blocs/notification_bloc/notification_bloc.dart';
import 'package:taxi_app/blocs/payment/payment_bloc.dart';
import 'package:taxi_app/blocs/payment_add/payment_add_bloc.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/cubits/get_client_informations_cubit/get_client_info_cubit.dart';
import 'package:taxi_app/cubits/notifications_cubit/notification_cubit.dart';
import 'package:taxi_app/cubits/order_cubit/order_cubit.dart';
import 'package:taxi_app/cubits/search/search_cubit.dart';
import 'package:taxi_app/cubits/security_cubit/security_cubit.dart';
import 'package:taxi_app/cubits/tab/tab_cubit.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/local/search_location/search_history_db.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/repositories/address_api_repository.dart';
import 'package:taxi_app/data/repositories/address_repos.dart';
import 'package:taxi_app/data/repositories/auth_repository.dart';
import 'package:taxi_app/data/repositories/driver_repos.dart';
import 'package:taxi_app/data/repositories/places_db_repository.dart';
import 'package:taxi_app/data/repositories/request_repo.dart';
import 'package:taxi_app/data/repositories/search_history_db.dart';
import 'package:taxi_app/data/repositories/user_repository.dart';
import 'package:taxi_app/services/api_service.dart';
import 'package:taxi_app/services/bloc_observer.dart';
import 'package:taxi_app/services/fcm.dart';
import 'package:taxi_app/services/locator_service.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/app_theme.dart';
import 'package:taxi_app/cubits/category_cubit/category_cubit.dart';
import 'package:taxi_app/cubits/get_driver_informations_cubit/get_driver_informations_cubit.dart';
import 'package:taxi_app/cubits/help_center/help_center_category_cubit.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await EasyLocalization.ensureInitialized();
  ServiceLocator.setup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = MyCustomObserver();

  await initFirebase(notificationsBloc..add(UpdateNotifications()));
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //
  // String appName = packageInfo.appName;
  // String packageName = packageInfo.packageName;
  // String version = packageInfo.version;
  // String buildNumber = packageInfo.buildNumber;
  //
  // debugPrint("APP NAME:$appName");
  // debugPrint("PACKAGE NAME:$packageName");
  // debugPrint("CURRENT VERSION :$version");
  // debugPrint("BUILD NUMBER :$buildNumber");

  runApp(App(apiService: ApiService()));
}

final notificationsBloc = NotificationBloc();

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => AddressRepo()),
        RepositoryProvider(create: (context) => RequestRepo()),
        RepositoryProvider(
          create: (context) => SearchHistoryRepository(SearchHistoryDatabase()),
        ),
        RepositoryProvider(
          create: (context) => PlacesDatabaseRepository(PlacesDatabase()),
        ),
        RepositoryProvider(
            create: (context) => AddressApiRepository(apiService: apiService)),
        RepositoryProvider(create: (context) => UserRepo()),
        RepositoryProvider(create: (context) => DriverRepo()),
        RepositoryProvider(
            create: (context) => AddressApiRepository(apiService: apiService))
      ],
      child: MultiBlocProvider(
        providers: [
          // Don't used
          BlocProvider(create: (context) => CodeInputCubit()),
          BlocProvider(
            create: (context) => AddressCubit(
                addressApiRepository: context.read<AddressApiRepository>()),
          ),
          BlocProvider(
              create: (context) => AuthCubit(context.read<AuthRepository>())),
          BlocProvider(
            create: (context) => SearchLocationBloc(
              searchHistoryRepository: context.read<SearchHistoryRepository>(),
              placesDatabaseRepository:
                  context.read<PlacesDatabaseRepository>(),
            ),
          ),
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(
              create: (context) =>
                  DriverBloc(driverRepo: context.read<DriverRepo>())),
          BlocProvider(create: (context) => NotificationCubit()),
          BlocProvider(create: (context) => SecurityCubit()),
          BlocProvider(create: (context) => SocialAuthBloc(AuthRepository())),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(create: (context) => notificationsBloc),
          BlocProvider(create: (context) => CreateOrderBloc()),
          BlocProvider(create: (context) => PaymentBloc()),
          BlocProvider(create: (context) => PaymentAddBloc()),
          BlocProvider(
              create: (context) =>
                  UserBloc(userRepo: context.read<UserRepo>())),
          BlocProvider(
              create: (context) =>
                  RequestBloc(requestDriverRepo: context.read<RequestRepo>())),
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => MessageBloc()),
          BlocProvider(create: (context) => SearchCubit()),
          BlocProvider(
              create: (context) =>
                  GetClientInfoCubit(context.read<UserRepo>())),
          BlocProvider(
              create: (context) =>
                  GetDriverInformationsCubit(context.read<DriverRepo>())),
          // Don't used
          BlocProvider(create: (context) => OrderCubit()),
          BlocProvider(create: (context) => HelpCenterCategoryCubit()),
          BlocProvider(create: (context) => LocationBloc()),
          BlocProvider(
              create: (context) =>
                  AddressBloc(addressRepo: context.read<AddressRepo>()))
        ],
        child: EasyLocalization(
            supportedLocales: const [
              Locale('ru', 'RU'),
              Locale('uz', 'UZ'),
              Locale('uz', 'Cyrl'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('uz', 'UZ'),
            child: const MyApp()),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(figmaWidth, figmaHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.darkTheme,
          initial: AdaptiveThemeMode.system,
          builder: (theme, darkTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: RouteNames.splashScreen,
              onGenerateRoute: AppRoutes.generateRoute,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            );
          },
        );
      },
    );
  }
}
