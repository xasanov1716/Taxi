import 'package:flutter/material.dart';
import 'package:taxi_app/ui/widgets/horizontal_tab.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(appBar: AppBar(), body: Center(
          child: Text('Привет мир',style: TextStyle(fontSize: 16,fontFamily: "Urbanist",fontWeight: FontWeight.w500),),
        ),),
      );
  }
}