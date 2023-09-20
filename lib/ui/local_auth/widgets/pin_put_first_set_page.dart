import 'package:flutter/material.dart';
import 'package:taxi_app/ui/local_auth/widgets/pin_put_feild.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('1'),
        PinPutField(),
      ],
    );
  }
}
