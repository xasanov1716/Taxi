import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class ChooseData extends StatefulWidget {
  const ChooseData(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.text3,
      });
  final String icon;
  final String text1;
  final String text2;
  final String text3;


  @override
  State<ChooseData> createState() => _ChooseDataState();
}

class _ChooseDataState extends State<ChooseData> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 92 * height / figmaHeight,
      width: 380 * width / figmaWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: 24 * width / figmaWidth,
            right: 24 * width / figmaWidth,
            bottom: 24 * height / figmaHeight,
            top: 24 * height / figmaHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(widget.icon),
            16.pw,
            RichText(
              text: TextSpan(
                text: widget.text1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    letterSpacing: 0.2.w),
                children: <TextSpan>[
                  TextSpan(
                    text: "\n${widget.text2}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: 0.2.w),
                  ),
                ],
              ),
            ),
            16.pw,
            Text("\$${widget.text3}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500)),
            16.pw,
            IconButton(
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                icon: selected
                    ? SvgPicture.asset(AppIcons.circle)
                    : SvgPicture.asset(AppIcons.circleTwo))
          ],
        ),
      ),
    );
  }
}
