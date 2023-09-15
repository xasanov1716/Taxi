import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:taxi_app/blocs/home/home_bloc.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/cubits/home/home_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/repositories/auth_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository(),)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
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
      designSize: const Size(428, 882),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.darkTheme,
          initial: AdaptiveThemeMode.system,
          builder: (theme, darkTheme){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: RouteNames.splashScreen,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          },
        );
      },
    );
  }
}