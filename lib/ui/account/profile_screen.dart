import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(onTap: () {}, title: "Fill Your Profile"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: SizedBox(
                  height: 100.h,
                  width: 100.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppIcons.emptyProfile,
                        height: 100.h,
                        width: 100.h,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            AppIcons.editSquare,
                            colorFilter: const ColorFilter.mode(
                                AppColors.warning, BlendMode.srcIn),
                            height: 30.h,
                            width: 30.h,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    hintText: "Full Name",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    hintText: "Nickname",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    suffixIcon: AppIcons.calendar,
                    hintText: "Date of Birth",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    suffixIcon: AppIcons.message,
                    hintText: "Email",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    hintText: "Phone Number",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: GlobalTextField(
                    hintText: "Gender",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    caption: "",
                    controller: TextEditingController()),
              ),
              GlobalButton(
                  color: AppColors.disabledButton,
                  title: "Continue",
                  radius: 100,
                  textColor: AppColors.black,
                  onTap: () {}),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
    );
  }
}
