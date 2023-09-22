import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/tip_for_driver_bottom_sheet.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

Future rateDriverBottomSheet(BuildContext context){
  int selectRate=0;
  return showModalBottomSheet(
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
      return StatefulBuilder(
        builder: (context, state) {
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const GlobalBottomSheetStart(
                      centerText: "Rate Driver",
                      name: "Daniel Austin",
                      carName: "Mercedes-Benz E-Class",
                      starCount: "4.8",
                      carNumber: "HSW 4736 XK",
                      commentTitle: "Wow 5 Star!",
                      commentSubtitle:
                      "Do you want to add additional tip for Daniel?"),
                  24.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        5,
                            (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w),
                          child: GestureDetector(
                            onTap: () {
                              state(() {
                                selectRate = index + 1;
                              });
                            },
                            child: index < selectRate
                                ? SvgPicture.asset(
                                AppIcons.rateStar,width: 40.w,)
                                : SvgPicture.asset(
                              AppIcons.star,
                              // ignore: deprecated_member_use
                              color: AppColors.primary,
                              width: 40.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.ph,
                  const Divider(),
                  24.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GlobalBottomSheetBottom(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        text: "Cancel",
                        colorText: getTheme(context)
                            ? AppColors.white
                            : AppColors.dark3,
                        colorContainer: getTheme(context)
                            ? AppColors.dark3
                            : AppColors.white,
                      ),
                      GlobalBottomSheetBottom(
                          onTap: (){
                            Navigator.pop(context);
                            tipForDriverBottomSheet(context);
                          },
                          text: "Submit",
                          colorText: AppColors.dark3,
                          colorContainer: AppColors.primary),
                    ],
                  ),
                  48.ph,
                ],
              ),
            ),
          );
        },
      );
    },
  );
}