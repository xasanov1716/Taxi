import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OfferBottomSheetItem extends StatelessWidget {
  const OfferBottomSheetItem(
      {super.key,
      required this.icon,
      required this.desc,
      required this.promoCode,
      required this.title,
      required this.text});

  final String icon;
  final String desc;
  final String promoCode;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height - height / 5,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Column(
        children: [
          Text(
            "Special Offers",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          24.ph,
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  24.ph,
                  SvgPicture.asset(
                    icon,
                    width: 125.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    text,
                    style: AppTextStyle.bodyLargeRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                  20.ph,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.orangeTransparent),
                    width: 192.w,
                    padding: EdgeInsets.all(20.w),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            promoCode,
                            style: Theme.of(context).textTheme.headlineSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          12.pw,
                          Expanded(
                            child: ZoomTapAnimation(
                              child: SvgPicture.asset(AppIcons.promoCode),
                              onTap: () {
                                FlutterClipboard.copy(promoCode)
                                    .then((value) => debugPrint('copied'));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  24.ph,
                  const Divider(),
                  24.ph,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Terms and Conditions:",
                        style: AppTextStyle.bodyLargeBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      12.ph,
                      Text(
                        desc,
                        style: AppTextStyle.bodyMediumRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          12.ph,
          GlobalButton(
            title: "Use Promo",
            radius: 100.r,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          24.ph,
        ],
      ),
    );
  }
}
