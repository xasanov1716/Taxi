import 'package:flutter/material.dart';
import 'package:taxi_app/ui/onboarding/carousel_pages/carousel_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CarouselPages(),
    );
  }
}
