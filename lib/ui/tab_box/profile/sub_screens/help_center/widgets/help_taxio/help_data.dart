import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../../../../utils/size/screen_size.dart';

class HelpData extends StatefulWidget {
  const HelpData(
      {super.key,
      required this.textOne,
        required this.texTwo,
     });
  final String textOne;
  final String texTwo;

  @override
  State<HelpData> createState() => _HelpDataState();
}

class _HelpDataState extends State<HelpData> {
  bool isAccordionOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAccordionOpen = !isAccordionOpen;
        });
      },
      child: Stack(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: getTheme(context) ? AppColors.black : AppColors.white,),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:24*width/figmaWidth,top: 24*width/figmaWidth,right: 24*width/figmaWidth, ),
                    child: Text(
                      widget.textOne,
                      style:  Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 24*width/figmaWidth,top: 24*width/figmaWidth,right: 24*width/figmaWidth, ),
                    child: SvgPicture.asset(AppIcons.arrowDownTwo),
                  )
                ],
              ),
             if (isAccordionOpen)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                    color: getTheme(context) ? AppColors.black : AppColors.white,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(left: 24*width/figmaWidth ,top: 15*width/figmaWidth,right: 24*width/figmaWidth, ),
                        height: 2,
                        width: double.infinity,
                        color: (getTheme(context) ? AppColors.white : AppColors.black).withOpacity(0.2),
                      ),
                      Padding(
                        padding:EdgeInsets.only(left: 24*width/figmaWidth ,top: 15*width/figmaWidth,right: 24*width/figmaWidth, bottom: 9*width/figmaWidth,),
                        child: Text(widget.texTwo,style:  Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500,fontSize: 14.sp),),
                      )
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
