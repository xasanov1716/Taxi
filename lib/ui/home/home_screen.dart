import 'package:flutter/material.dart';

class HomeScree extends StatelessWidget {
  const HomeScree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Привет мир',
          style: TextStyle(
            fontSize: 32,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w500,),
        ),
      ),
    );
  }
}
