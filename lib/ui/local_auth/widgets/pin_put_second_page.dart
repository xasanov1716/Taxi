import 'package:flutter/material.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_feild.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('2'),
        PinPutField(),
      ],
    );
  }
}
