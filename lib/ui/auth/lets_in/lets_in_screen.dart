import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';
import '../widgets/auth_navigator_button.dart';
import '../widgets/custom__auth_divider.dart';
import '../widgets/custom_auth_social_network_button.dart';

class LetsInScreen extends StatelessWidget {
  const LetsInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(onTap: () {  }, title: ''),
      body: BlocListener<SocialAuthBloc, SocialAuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(child: Text("Kutmoqda"));
                });
          }
          if (state is AuthSuccess) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Text(state.successText),
                  );
                });
          }
          if (state is AuthError) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Text(state.errorText),
                  );
                });
          }
        },
        child:  Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, bottom: 30.0, top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric( 
                  horizontal: 71.w,
                ),
                child: Image.asset(AppIcons.signIn)),
              30.25.ph,
              Text("Dastyorga Kirish",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 42.sp)),
              30.ph,
              Column(
                children: [
                  CustomAuthButton(
                      imageUrl: AppIcons.facebook,
                      label: "Facebook bilan davom eting",
                      onTap: () {
                        context.read<SocialAuthBloc>().add(LoginWithFacebook());
                      }),
                  16.ph,
                  CustomAuthButton(
                      imageUrl: AppIcons.google,
                      label: "Google bilan davom eting",
                      onTap: () {
                        context.read<SocialAuthBloc>().add(LoginWithGoogle());
                      }),
                  16.ph,
                  CustomAuthButton(
                      imageUrl: AppIcons.apple,
                      label: "Apple bilan davom eting",
                      onTap: () {
                        context.read<SocialAuthBloc>().add(LoginWithApple());
                      }),
                  24.ph,
                  const CustomAuthDividerWidget(label: "yoki"),
                  24.ph,
                  GlobalButton(
                      color: AppColors.primary,
                      title: "Parol bilan tizimga kiring",
                      radius: 100,
                      textColor: AppColors.dark3,
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      }),
                ],
              ),
              AuthNavigatorButton(
                  title: "Don’t have an account?",
                  onTapTitle: "Sign up",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.signUp);
                  }),
            ],
          ),
        )),
    );
  }
}
