import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_bottom.dart';
import 'package:taxi_app/ui/tab_box/home/bottom_sheet/widgets/global_bottom_sheet_start.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../utils/theme/get_theme.dart';

class RateDriverBottomSheet extends StatefulWidget {
  const RateDriverBottomSheet({super.key});

  @override
  State<RateDriverBottomSheet> createState() => _RateDriverBottomSheetState();
}

class _RateDriverBottomSheetState extends State<RateDriverBottomSheet> {
  int selectRate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        title: const Text(
          "Rate Driver Bottom Sheet",
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
                                                AppIcons.rateStar)
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
                                    text: "Cancel",
                                    colorText: getTheme(context)
                                        ? AppColors.white
                                        : AppColors.dark3,
                                    colorContainer: getTheme(context)
                                        ? AppColors.dark3
                                        : AppColors.white,
                                  ),
                                  const GlobalBottomSheetBottom(
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
