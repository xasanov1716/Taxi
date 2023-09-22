import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/rate_driver_bottom_sheet.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/smile_widgets.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import '../../../../utils/theme/get_theme.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        title: const Text(
          "Bottom Sheet",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.primary),
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
                  return SizedBox(
                    child: Padding(
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
                          const SmileWidgets(
                              icon1: AppIcons.smileEyeGlass,
                              icon2: AppIcons.smileExcited,
                              icon3: AppIcons.smileHappy),
                          24.ph,
                          const SmileWidgets(
                              icon1: AppIcons.smileVeryHappy,
                              icon2: AppIcons.smileAngry,
                              icon3: AppIcons.smileQuiet),
                          24.ph,
                          const SmileWidgets(
                              icon1: AppIcons.smileUnhappy,
                              icon2: AppIcons.smileTired,
                              icon3: AppIcons.smileCry),
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
                    ),
                  );
                },
              );
            },
            child: Container(
                padding: EdgeInsets.only(
                    left: 16.w, right: 20.w, top: 16.h, bottom: 16.h),
                child: const Row(children: [])),
          ),
        ),
      ),
    );
  }
}
