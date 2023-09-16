import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/code_input_field.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CodeInputCubit>().setContext(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Forget Password",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 24 / figmaWidth,
            right: width * 24 / figmaWidth,
            top: 24 * height / figmaHeight,
            bottom: 48 * height / figmaHeight),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CodeInputField(),
              GlobalButton(
                color: AppColors.primary,
                title: "Verify",
                radius: 100.r,
                textColor: AppColors.dark3,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.createPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
