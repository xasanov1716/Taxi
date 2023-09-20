import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/special_offers/widgets/offer_bottom_sheet.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SpecialOfferButton extends StatelessWidget {
  const SpecialOfferButton(
      {super.key,
      required this.title,
      required this.text,
      required this.icon,
      required this.promoCode,
      required this.desc});

  final String title;
  final String text;
  final String icon;
  final String promoCode;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4), // Horizontal and vertical offset
              blurRadius: 60, // Blur radius
              spreadRadius: 0, // Spread radius
              color: Color.fromRGBO(4, 6, 15, 0.05), // Color with opacity
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                showDragHandle: true,
                isScrollControlled: true,
                context: context,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return StatefulBuilder(builder: (context, state) {
                    return OfferBottomSheetItem(
                      icon: icon,
                      desc: desc,
                      promoCode: promoCode,
                      title: title,
                      text: text,
                    );
                  });
                });
          },
          child: Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 20.w, top: 16.h, bottom: 16.h),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.ph,
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
