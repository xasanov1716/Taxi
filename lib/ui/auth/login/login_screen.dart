import 'package:flutter/material.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Create your Account'),
            // GlobalTextField(
            //   hintText: 'Phone number',
            //   keyboardType: TextInputType.phone,
            //   textInputAction: TextInputAction.next,
            //   prefixIcon: AppIcons.call,
            //   caption: '',
            //   controller: TextEditingController(),
            // )
            Column(),
            Column(),
            Row(),
          ],
        ),
      )),
    );
  }
}
