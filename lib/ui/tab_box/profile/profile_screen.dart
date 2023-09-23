import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/local_auth/widgets/user_image.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/log_out.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/theme_changer_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String image = "";
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Image.asset(
              AppIcons.taxiLogotip,
              height: 32.h,
            ),
          ),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            getIcon(
              AppIcons.moreCircle,
              context: context,
              onTap: () {},
            ),
            12.pw
          ],
        ),
        body: Column(
          children: [
            30.ph,
            UserImage(
                userImage: image.isEmpty
                    ? Image.asset(
                        AppIcons.drFake1,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.file(
                          File(image),
                          width: 120 * width / figmaWidth,
                          height: 120 * width / figmaWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                edit: AppIcons.getSvg(
                    name: AppIcons.editSquare, iconType: IconType.bold),
                onTap: () {
                  showBottomSheetDialog(
                    context,
                  );
                }),
            12.ph,
            Text(
              "Andrew Ainsley",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            8.ph,
            Text(
              "+1 111 467 378 399",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const Divider(),
            ),
            Expanded(
                child: ListView(
              children: [
                ProfileButton(
                    text: "Edit Profile", icon: AppIcons.profile, onTap: () {}),
                ProfileButton(
                    text: "Address", icon: AppIcons.location, onTap: () {}),
                ProfileButton(
                    text: "Notification",
                    icon: AppIcons.notification,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteNames.notificationSwitch);
                    }),
                ProfileButton(
                    text: "Payment", icon: AppIcons.wallet, onTap: () {
                  Navigator.pushNamed(
                      context, RouteNames.payment);
                }),
                ProfileButton(
                    text: "Security",
                    icon: AppIcons.shieldDone,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.security);
                    }),
                ProfileButton(
                  text: "Language",
                  icon: AppIcons.moreCircle,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.languageScreen);
                  },
                  isLanguage: true,
                  language: tr("language_type"),
                ),
                const ThemeChangerButton(),
                ProfileButton(
                    text: "Privacy Policy",
                    icon: AppIcons.lock,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.privacyPolicy);
                    }),
                ProfileButton(
                    text: "Help Center",
                    icon: AppIcons.infoSquare,
                    onTap: () {}),
                ProfileButton(
                    text: "Invite Friends", icon: AppIcons.user3, onTap: () {}),
                ProfileButton(
                  text: "Log Out",
                  icon: AppIcons.logOut,
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32.r),
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      showDragHandle: true,
                      context: context,
                      builder: (context) {
                        return const LogOutItem();
                      },
                    );
                  },
                  isLogOut: true,
                ),
              ],
            )),
          ],
        ));
  }

  void showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: ListTile(
                    onTap: () {
                      _getFromCamera();
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera_alt,
                      color: AppColors.white,
                    ),
                    title: Text(
                      "Select from Camera",
                      style: TextStyle(color: AppColors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: ListTile(
                    onTap: () {
                      _getFromGallery();
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.photo,
                      color: AppColors.white,
                    ),
                    title: Text(
                      "Select from Gallery",
                      style: TextStyle(color: AppColors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512 * height / figmaHeight,
      maxWidth: 512 * width / figmaWidth,
    );

    if (xFile != null && context.mounted) {
      context.read<UserCubit>().updateCurrentUserField(
            fieldKey: UserFieldKeys.image,
            value: xFile.path,
          );
      image = xFile.path;
      setState(() {});
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512 * height / figmaHeight,
      maxWidth: 512 * width / figmaWidth,
    );
    if (xFile != null && context.mounted) {
      context.read<UserCubit>().updateCurrentUserField(
            fieldKey: UserFieldKeys.image,
            value: xFile.path,
          );
      image = xFile.path;
      setState(() {});
    }
  }
}
