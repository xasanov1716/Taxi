import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

Future tipForDriverBottomSheet(BuildContext context){
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
        builder: (context,state) {
          return Padding(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      4,
                          (index) => GestureDetector(
                          onTap: () {
                            state(() {
                              selectRate = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(24.r),
                            decoration: selectRate==index?BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(color: AppColors.primary),
                                color: AppColors.primary
                            ):BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(color: AppColors.primary)
                            ),
                            child: Center(
                              child: Text("\$${index + 2}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    fontFamily: "Urbanist",
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: getTheme(context)
                                        ? AppColors.white
                                        : AppColors.dark3),),
                            ),
                          )
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
                        onTap: (){},
                        text: "Submit",
                        colorText: AppColors.dark3,
                        colorContainer: AppColors.primary),
                  ],
                ),
                48.ph,
              ],
            ),
          );
        },
      );
    },
  );
}
