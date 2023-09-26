import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/rate_driver_bottom_sheet.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/mood_grid_view.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void moodSelectionDialog(BuildContext context) {


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
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GlobalBottomSheetStart(
                  centerText: "Your Mood",
                  name: "Daniel Austin",
                  carName: "Mercedes-Benz E-Class",
                  starCount: "4.8",
                  carNumber: "HSW 4736 XK",
                  commentTitle: "What's Your Mood!",
                  commentSubtitle: "about this trip?"),
              24.ph,
              const MoodGridView(),
              24.ph,
              const Divider(),
              24.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GlobalBottomSheetBottom(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel",
                    colorText:
                        getTheme(context) ? AppColors.white : AppColors.dark3,
                    colorContainer:
                        getTheme(context) ? AppColors.dark3 : AppColors.white,
                  ),
                  GlobalBottomSheetBottom(
                      onTap: () {
                        Navigator.pop(context);
                        rateDriverBottomSheet(context);
                      },
                      text: "Submit",
                      colorText: AppColors.dark3,
                      colorContainer: AppColors.primary),
                ],
              ),
              48.ph,
            ],
          ),
        );
      });
    },
  );
}
