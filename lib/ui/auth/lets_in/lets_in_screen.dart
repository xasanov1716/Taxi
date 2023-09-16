import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
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
      body: BlocListener<AuthBloc, AuthState>(
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
        child: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0,  top: 24),
          child: ListView(
            physics:const BouncingScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [30.ph,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 71.w,
                ),
                child: Image.asset(AppIcons.signIn),
              ),30.25.ph,
              Center(
                child: Text("Dastyorga Kirish",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 42.sp)),
              ),
              30.25.ph,
              Column(
                children: [
                  CustomAuthButton(
                      imageUrl: AppIcons.facebook,
                      label: "Facebook bilan davom eting",
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithFacebook());
                      }),
                  16.ph,
                  CustomAuthButton(
                      imageUrl: AppIcons.google,
                      label: "Google bilan davom eting",
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithGoogle());
                      }),
                  16.ph,
                  CustomAuthButton(
                      imageUrl: AppIcons.apple,
                      label: "Apple bilan davom eting",
                      onTap: () {
                        context.read<AuthBloc>().add(LoginWithApple());
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
              ),30.25.ph,
              AuthNavigatorButton(
                  title: "Hisobingiz yo'qmi?",
                  onTapTitle: "Ro'yxatdan o'tish",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.signUp);
                  }),
            ],
          ),
        ),),
    );
  }
}
