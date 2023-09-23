import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/rate_driver_bottom_sheet.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void moodSelectionDialog(BuildContext context) {
  List<String> smiles = [
    AppIcons.smileUnhappy,
    AppIcons.smileCry,
    AppIcons.smileTired,
    AppIcons.smileAngry,
    AppIcons.smileQuiet,
    AppIcons.smileVeryHappy,
    AppIcons.smileExcited,
    AppIcons.smileHappy,
    AppIcons.smileEyeGlass
  ];

  int selectedIndex = -1;

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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    ...List.generate(
                      smiles.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = -1;
                            } else {
                              selectedIndex = index;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(16.r),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: selectedIndex == index
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            smiles[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
