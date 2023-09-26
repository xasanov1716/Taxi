import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/pages/first_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/pages/second_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/pages/third_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.navigateFromAuth});

  final bool navigateFromAuth;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EditAppBar(title: "Edit Profile"),
      body: BlocConsumer<SocialAuthBloc, SocialAuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      FirstPage(),
                      SecondPage(),
                      ThirdPage(),
                    ],
                  ),
                ),
                12.ph,
                GlobalButton(
                  title: "Update",
                  onTap: () {
                    if (currentPage == 0) {
                      context
                          .read<SocialAuthBloc>()
                          .add(AuthFirstStepSuccessEvent());
                    } else if (currentPage == 1) {
                      context
                          .read<SocialAuthBloc>()
                          .add(AuthSecondStepSuccessEvent());
                    } else if (currentPage == 2) {
                      context
                          .read<SocialAuthBloc>()
                          .add(AuthThirdStepSuccessEvent());
                    }
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthFirstStepSuccessState) {
            currentPage = 1;
            pageController.animateToPage(
              1,
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
            );
          }
          if (state is AuthSecondStepSuccessState) {
            currentPage = 2;
            print('ANIMET');
            pageController.animateToPage(
              2,
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
            );
          }
          if (state is AuthThirdStepSuccessState) {
            if (widget.navigateFromAuth) {
              Navigator.pushReplacementNamed(
                  context, RouteNames.setPinCodeScreen);
            } else {
              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }
}
