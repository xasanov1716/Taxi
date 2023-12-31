import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_dialog.dart';
import 'package:taxi_app/ui/widgets/user_image.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/log_out.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_button.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/theme_changer_button.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String image = "";
  ImagePicker picker = ImagePicker();


  init()async{
    if (context.mounted) {
      await context.read<DriverBloc>().getDriverByDocId();
      if (context.mounted) {
        await context.read<UserBloc>().getUserByDocId();
      }
  }}

  @override
  void initState() {
    init();
    super.initState();
  }
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
         tr('profile'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          // getIcon(
          //   AppIcons.moreCircle,
          //   context: context,
          //   onTap: () {},
          // ),
          12.pw
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Builder(builder: (context)  {
           return  StorageRepository.getString(StorageKeys.userRole) == AppConstants.driver
                ? BlocConsumer<DriverBloc, DriverState>(
              builder: (context, state) {
                StorageRepository.putString(StorageKeys.userRole, AppConstants.driver);

                return Column(
                  children: [
                    UserImage(
                      onTap: () {
                        profileDialog(
                          picker: picker,
                          context: context,
                          valueChanged: (v) {},
                        );
                      },
                    ),
                    12.ph,
                    Text(
                      state.driverModel.fullName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    8.ph,
                    Text(
                      "+998 ${state.driverModel.phoneNumber}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                );
              },
              listener: (context, state) {
                setState(() {});
              },
            )
                : BlocConsumer<UserBloc, UsersState>(
              builder: (context, state) {
                return Column(
                  children: [
                    UserImage(
                      onTap: () {
                        profileDialog(
                          picker: picker,
                          context: context,
                          valueChanged: (v) {},
                        );
                      },
                    ),
                    12.ph,
                    Text(
                      state.userModel.fullName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    8.ph,
                    Text(
                      "+998 ${state.userModel.phone}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                );
              },
              listener: (context, state) {
                setState(() {});
              },
            );
          },),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Divider(),
          ),
          ProfileButton(
            text: tr('edit_profile'),
            icon: AppIcons.profile,
            onTap: () {
              StorageRepository.getString(StorageKeys.userRole) == AppConstants.driver
                  ? Navigator.pushNamed(
                      context,
                      RouteNames.editProfileDriver,
                      arguments: false,
                    )
                  : Navigator.pushNamed(
                      context,
                      RouteNames.editProfileClient,
                      arguments: false,
                    );
            },
          ),
          ProfileButton(
              text: tr('address'),
              icon: AppIcons.location,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.addressScreen);
              }),
          ProfileButton(
              text: tr('notification'),
              icon: AppIcons.notification,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.notificationSwitch);
              }),
          ProfileButton(
              text:tr('payment'),
              icon: AppIcons.wallet,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.payment);
              }),
          ProfileButton(
              text: tr('security'),
              icon: AppIcons.shieldDone,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.security);
              }),
          ProfileButton(
            text: tr('language'),
            icon: AppIcons.moreCircle,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.languageScreen);
            },
            isLanguage: true,
            language: tr("language_type"),
          ),
          const ThemeChangerButton(),
          ProfileButton(
              text:tr('privacy_policy'),
              icon: AppIcons.lock,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.privacyPolicy);
              }),
          ProfileButton(
              text: tr('help_center'),
              icon: AppIcons.infoSquare,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.helpCenterScreen);
              }),
          ProfileButton(
              text: tr('invite_friends'),
              icon: AppIcons.user3,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.inviteFriends);
              }),
          ProfileButton(
            text: tr('log_out'),
            icon: AppIcons.logOut,
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      ),
    );
  }
}
