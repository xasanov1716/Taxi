import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/social_auth_bloc/social_auth_bloc.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/first_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/second_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/pages/third_page.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/show_snackbar.dart';

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
            widget.navigateFromAuth
                ? Navigator.pushNamed(context, RouteNames.letsIn)
                : Navigator.pop(context);
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
                  title: "Next",
                  onTap: () {
                    if (widget.navigateFromAuth) {
                      context.read<DriverBloc>().updateDriverField(
                            fieldKey: DriverFieldKeys.phoneNumber,
                            value: BlocProvider.of<AuthCubit>(context)
                                .state
                                .phoneNumber,
                          );

                      context.read<DriverBloc>().updateDriverField(
                            fieldKey: DriverFieldKeys.password,
                            value: BlocProvider.of<AuthCubit>(context)
                                .state
                                .password,
                          );
                    }

                    if (currentPage == 0) {
                      if (context.read<DriverBloc>().canRegister1().isEmpty) {
                        debugPrint(
                            'can register 1 ${context.read<DriverBloc>().state.driverModel.fullName}');
                        setState(() {
                          currentPage = 1;
                          pageController.animateToPage(
                            currentPage,
                            duration: const Duration(seconds: 1),
                            curve: Curves.linear,
                          );
                        });
                      } else {
                        showSnackBar(
                            context: context,
                            text:
                                '${context.read<DriverBloc>().canRegister1()} is required');
                      }
                    } else if (currentPage == 1) {
                      if (context.read<DriverBloc>().canRegister2().isEmpty) {
                        setState(() {
                          currentPage = 2;
                          pageController.animateToPage(
                            currentPage,
                            duration: const Duration(seconds: 1),
                            curve: Curves.linear,
                          );
                        });
                      } else {
                        showSnackBar(
                            context: context,
                            text:
                                '${context.read<DriverBloc>().canRegister2()} is required');
                      }
                    } else if (currentPage == 2) {
                      if (widget.navigateFromAuth) {
                        if (context.read<DriverBloc>().state.driverModel.from !=
                            0) {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.tabBox,
                          );
                          context.read<DriverBloc>().add(AddDriverEvent());
                        } else {
                          showSnackBar(
                              context: context, text: 'Addresses are required');
                        }
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
