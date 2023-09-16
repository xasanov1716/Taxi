import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(
            fontSize: 32,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w500,),
        ),
      ),
    );
  }
}
