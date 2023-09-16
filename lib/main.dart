import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:taxi_app/blocs/home/home_bloc.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/cubits/home/home_cubit.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/repositories/auth_repository.dart';

import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => AuthRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => CodeInputCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => AuthBloc()),
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
              initialRoute: RouteNames.splashScreen,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          },
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String selectedOption = 'Option 1'; // Initial selected option

//   void _showPopup(BuildContext context) async {
//     final selected = await showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select an Option'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 title: Text('Option 1'),
//                 onTap: () {
//                   Navigator.pop(context, 'Option 1');
//                 },
//               ),
//               ListTile(
//                 title: Text('Option 2'),
//                 onTap: () {
//                   Navigator.pop(context, 'Option 2');
//                 },
//               ),
//               ListTile(
//                 title: Text('Option 3'),
//                 onTap: () {
//                   Navigator.pop(context, 'Option 3');
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     if (selected != null) {
//       setState(() {
//         selectedOption = selected;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popup Button Example'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Select an Option',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.arrow_drop_down),
//                       onPressed: () {
//                         _showPopup(context);
//                       },
//                     ),
//                   ),
//                   controller: TextEditingController(text: selectedOption),
//                   readOnly: true,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
