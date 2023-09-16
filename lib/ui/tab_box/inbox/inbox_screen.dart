import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'InboxScreen',
        style: TextStyle(
          fontSize: 32,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w500,),
      ),
    );
  }
}
