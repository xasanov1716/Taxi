import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ThemeChangerButton extends StatefulWidget {
  const ThemeChangerButton({super.key});

  @override
  State<ThemeChangerButton> createState() => _ThemeChangerButtonState();
}

class _ThemeChangerButtonState extends State<ThemeChangerButton> {
  bool isSwitched = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    isSwitched = await Future.microtask(() => getTheme(context));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          setState(() {
            isSwitched = !isSwitched;
          });
          if (isSwitched) {
            AdaptiveTheme.of(context).setDark();
          } else {
            AdaptiveTheme.of(context).setLight();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.getSvg(name: AppIcons.show, iconType: IconType.curved),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
              16.pw,
              Text(
                tr('dark_mode'),
                style: AppTextStyle.bodyXlargeSemibold,
              ),
              const Spacer(),
              16.pw,
              CupertinoSwitch(
                activeColor: AppColors.primary,
                onChanged: (v) {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                  if (isSwitched) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
                value: isSwitched,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
