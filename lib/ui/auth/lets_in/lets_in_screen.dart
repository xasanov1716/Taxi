import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/custom_circular.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/icons/app_icons.dart';
import '../widgets/auth_navigator_button.dart';
import '../widgets/custom_auth_divider.dart';
import '../widgets/custom_auth_social_network_button.dart';

class LetsInScreen extends StatelessWidget {
  const LetsInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  GlobalAppBar(),
      body: BlocListener<SocialAuthBloc, SocialAuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 300.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ));
                });
          }
          if (state is AuthSuccess) {
            Navigator.pop(context);
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
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24),
          child: Column(
            children: [
              30.ph,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 71.w,
                ),
                child: Image.asset(AppIcons.signIn),
              ),
              30.25.ph,
              Center(
                child: Text(tr("lets_you_in"),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 42.sp)),
              ),
              // 30.25.ph,
              // CustomAuthButton(
              //     imageUrl: AppIcons.facebook,
              //     label: tr("continue_with_facebook"),
              //     onTap: () {
              //       context.read<SocialAuthBloc>().add(LoginWithFacebook());
              //     }),
              // 16.ph,
              // CustomAuthButton(
              //     imageUrl: AppIcons.google,
              //     label: tr("continue_with_google"),
              //     onTap: () {
              //       context.read<SocialAuthBloc>().add(LoginWithGoogle());
              //     }),
              // 16.ph,
              // CustomAuthButton(
              //     imageUrl: AppIcons.apple,
              //     label: tr("continue_with_apple"),
              //     onTap: () {
              //       context.read<SocialAuthBloc>().add(LoginWithApple());
              //     }),
              // 24.ph,
              // const CustomAuthDividerWidget(label: tr("or")),
              24.ph,
              const Spacer(),
              GlobalButton(
                  color: AppColors.primary,
                  title: tr("sign_in_with_password"),
                  radius: 100,
                  textColor: AppColors.dark3,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  }),
              30.ph,
              AuthNavigatorButton(
                title: tr("don't_have_an_account?"),
                onTapTitle: tr("sign_up"),
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.signUp);
                },
              ),
              24.ph,
            ],
          ),
        ),
      ),
    );
  }
}
