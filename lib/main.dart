import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/home/home_bloc.dart';
import 'package:taxi_app/blocs/search_location_bloc/places_bloc.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/cubits/tab/tab_cubit.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/local/search_location/search_history_db.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/repositories/address_api_repository.dart';
import 'package:taxi_app/data/repositories/auth_repository.dart';
import 'package:taxi_app/data/repositories/places_db_repository.dart';
import 'package:taxi_app/data/repositories/search_history_db.dart';
import 'package:taxi_app/services/api_service.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/app_theme.dart';
import 'cubits/category_cubit/category_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'ui/contact_to_driver/sub_screens/driver_detail/driver_detail_screen.dart';
import 'ui/create_order/sub_screens/select_transport/select_transposrt_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(
          create: (context) => SearchHistoryRepository(SearchHistoryDatabase()),
        ),
        RepositoryProvider(
          create: (context) => PlacesDatabaseRepository(PlacesDatabase()),
        ),
        RepositoryProvider(
            create: (context) => AddressApiRepository(apiService: apiService))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CodeInputCubit()),
          BlocProvider(
            create: (context) => AddressCubit(

                addressApiRepository: context.read<AddressApiRepository>()),
          ),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
            create: (context) => SearchLocationBloc(
              searchHistoryRepository: context.read<SearchHistoryRepository>(),
              placesDatabaseRepository:
                  context.read<PlacesDatabaseRepository>(),
            ),
          ),
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => SocialAuthBloc()),
            BlocProvider(create: (context) => UserCubit()),
          BlocProvider(
            create: (_) => CategoryCubit(),
          ),
        ],
        child: const MyApp(),
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
             home: DriverDetailScreen(),
             /* initialRoute: RouteNames.splashScreen,
              onGenerateRoute: AppRoutes.generateRoute,*/
            );
          },
        );
      },
    );
  }
}
