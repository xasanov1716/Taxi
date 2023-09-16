import 'package:flutter/widgets.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'WalletScreen',
        style: TextStyle(
          fontSize: 32,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w500,),
      ),
    );
  }
}
