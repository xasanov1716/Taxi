import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';
import '../widgets/auth_navigator_button.dart';
import '../widgets/custom__auth_divider.dart';
import '../widgets/custom_auth_social_network_button.dart';

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
                  CustomAuthButton(imageUrl: AppIcons.facebook,label: "Continue with Facebook", onTap: () {  }),
                  16.ph,
                  CustomAuthButton(imageUrl: AppIcons.google,label: "Continue with Google", onTap: () {  }),
                  16.ph,

                  CustomAuthButton(imageUrl: AppIcons.apple,label: "Continue with Apple", onTap: () {  }),
                  24.ph,
                const  CustomAuthDividerWidget(label: "or"),
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
              AuthNavigatorButton(title: "Don’t have an account?",onTapTitle: "Sign up",onTap: (){}),
            ],
          ),
        )),
      ),
    );
  }
}
