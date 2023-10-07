import 'package:easy_localization/easy_localization.dart';
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
import 'package:taxi_app/utils/size/size_extension.dart';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CodeInputCubit>().setContext(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        title: tr('forgot_password'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 24 / figmaWidth,
          right: width * 24 / figmaWidth,
          top: 24 * height / figmaHeight,
          bottom: 40 * height / figmaHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            97.ph,
            const CodeInputField(),
            const Spacer(),
            GlobalButton(
              color: AppColors.primary,
              title: tr('verify'),
              radius: 100.r,
              textColor: AppColors.dark3,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.createPassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
