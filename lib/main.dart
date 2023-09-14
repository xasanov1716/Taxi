import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Привет мир',style: TextStyle(fontSize: 16,fontFamily: "Urbanist",fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}
