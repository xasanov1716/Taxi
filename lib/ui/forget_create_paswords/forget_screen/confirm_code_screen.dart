import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/code_input_field.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CodeInputCubit>().setContext(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                  Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const CodeInputField(),
              GlobalButton(
                color: AppColors.primary,
                title: "Verify",
                radius: 100,
                textColor: AppColors.dark3,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.createPassword);
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
