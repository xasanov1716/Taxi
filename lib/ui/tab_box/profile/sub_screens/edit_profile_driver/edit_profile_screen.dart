import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/first_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/second_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/third_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import 'widgets/rol_dialog.dart';

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
      appBar: EditAppBar(
        title: widget.navigateFromAuth ? "Create Profile" : "Edit Profile",
        onTap: () {
          if (currentPage > 0) {
            setState(() {
              currentPage--;
              pageController.animateToPage(
                currentPage,
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
              );
            });
          } else {
            Navigator.pop(context);
          }
        },
        bottom: PreferredSize(
          preferredSize: Size(100.w, 50.h),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const JumpingDotEffect(
              dotHeight: 16,
              activeDotColor: AppColors.primary,
              dotWidth: 25,
              jumpScale: .7,
              verticalOffset: 15,
            ),
          ),
        ),
      ),
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
                      FirstPage(isFromAuth: widget.navigateFromAuth),
                      SecondPage(isFromAuth: widget.navigateFromAuth),
                      ThirdPage(isFromAuth: widget.navigateFromAuth),
                    ],
                  ),
                ),
                12.ph,
                GlobalButton(
                  title: "Update",
                  onTap: (){
                   /* ShowRoleDialog(context);*/
                    if (currentPage == 0) {
                      setState(() {
                        currentPage = 1;
                        pageController.animateToPage(
                          currentPage,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      });
                    } else if (currentPage == 1) {
                      setState(() {
                        currentPage = 2;
                        pageController.animateToPage(
                          currentPage,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      });
                    } else if (currentPage == 2) {
                      if (widget.navigateFromAuth) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.setPinCodeScreen,
                        );
                        context.read<DriverBloc>().add(AddDriverEvent());
                      } else {
                        Navigator.pop(context);
                        context.read<DriverBloc>().add(UpdateDriverEvent());
                      }
                    }
                  },
                  radius: 100.r,
                  color: AppColors.primary,
                )
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
