import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/security_cubit/security_cubit.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/switcher_listtile.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Security"),
      body: BlocBuilder<SecurityCubit, SecurityState>(
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...List.generate(state.securityNames.length, (index) {
                String securityName = state.securityNames[index];
                bool value = state.securityValues[index];

                return SwitcherListTile(
                  isSwitched: value,
                  onTap: () {
                    context
                        .read<SecurityCubit>()
                        .updateSecurityValues(securityName, !value, state.securityNames);
                  },
                  text: securityName,
                );
              }),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.all(24.w),
                title: const Text("Google Authenticator"),
                trailing: SvgPicture.asset(
                  AppIcons.arrowRight2,
                  colorFilter: ColorFilter.mode(
                      getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
                ),
              ),
              // GlobalButton(
              //   padding: const EdgeInsets.all(24),
              //   title: 'Change PIN',
              //   onTap: () {
              //     Navigator.pushNamed(context, RouteNames.enterPinScreen,
              //         arguments: true);
              //   },
              //   color: AppColors.primary,
              //   radius: 100.r,
              // ),
              GlobalButton(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                title: 'Change Password',
                onTap: () {},
                radius: 100.r,
              ),
            ],
          );
        },
      ),
    );
  }
}
