import 'package:flutter/material.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';

class PaymentAddCardScreen extends StatelessWidget {
  const PaymentAddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(),
      body: Center(
        child: Text("Add New Card"),
      ),
    );
  }
}
