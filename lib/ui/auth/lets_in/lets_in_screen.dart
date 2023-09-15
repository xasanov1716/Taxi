import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';

class LestInScreen extends StatelessWidget {
  const LestInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            CircularProgressIndicator();
          }
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Authentication success for Facebook")));
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Authentication error for Facebook")));
          }
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, bottom: 48.0, top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 71.w,
                ),
                child: Image.asset(AppIcons.signIn),
              ),
              Text("Let’s you in",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 48)),
              Column(
                children: [
                  GlobalButton(
                      color: AppColors.c_200,
                      title: "Continue with Facebook",
                      radius: 16,
                      textColor: AppColors.c_900,
                      rightIcon: AppIcons.facebook,
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithFacebook());
                      }),
                  16.ph,
                  GlobalButton(
                      color: AppColors.c_200,
                      title: "Continue with Google",
                      radius: 16,
                      textColor: AppColors.c_900,
                      rightIcon: AppIcons.google,
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithGoogle());
                      }),
                  16.ph,
                  GlobalButton(
                      color: AppColors.c_200,
                      title: "Continue with Apple",
                      radius: 16,
                      textColor: AppColors.c_900,
                      rightIcon: AppIcons.apple,
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithApple());
                      }),
                  24.ph,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.c_200,
                          height: 2.h,
                        ),
                      ),
                      9.pw,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          "or",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.c_700, fontSize: 18),
                        ),
                      ),
                      9.pw,
                      Expanded(
                        child: Divider(
                          color: AppColors.c_200,
                          height: 2.h,
                        ),
                      ),
                    ],
                  ),
                  24.ph,
                  GlobalButton(
                      color: AppColors.primary,
                      title: "Sign in with password",
                      radius: 100,
                      textColor: AppColors.dark3,
                      rightIcon: AppIcons.apple,
                      onTap: () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.c_500, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
