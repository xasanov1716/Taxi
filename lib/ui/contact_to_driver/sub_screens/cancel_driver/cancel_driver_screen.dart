import 'package:flutter/material.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';

class CancelDriverScreen extends StatefulWidget {
  const CancelDriverScreen({super.key});

  @override
  State<CancelDriverScreen> createState() => _CancelDriverScreenState();
}

class _CancelDriverScreenState extends State<CancelDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Cancel Taxi",onTap: (){Navigator.pop(context);}),

    );
  }
}
