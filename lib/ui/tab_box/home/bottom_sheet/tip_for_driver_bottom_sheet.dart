import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../utils/theme/get_theme.dart';

class TipForDriverBottomSheet extends StatefulWidget {
  const TipForDriverBottomSheet({super.key});

  @override
  State<TipForDriverBottomSheet> createState() => _TipForDriverBottomSheetState();
}

class _TipForDriverBottomSheetState extends State<TipForDriverBottomSheet> {
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
          "Tip For Driver Bottom Sheet",
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
                    builder: (context,state) {
                      return SizedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Tip for Driver",
                                style: Theme.of(context)
                                    .dialogTheme
                                    .titleTextStyle
                                    ?.copyWith(
                                    fontSize: 24.sp,
                                    color: getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_900),
                              ),
                              24.ph,
                              const Divider(),
                              24.ph,
                              Row(
                                children: [
                                  SizedBox(
                                      width: 60.w,
                                      height: 60.w,
                                      child: Image.asset(AppIcons.testAvatar)),
                                  20.pw,
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Daniel Austin",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                          fontFamily: "Urbanist",
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      8.ph,
                                      Text(
                                        "Mercedes-Benz E-Class",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                          fontFamily: "Urbanist",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 20.w,
                                            width: 20.w,
                                            child: SvgPicture.asset(
                                              AppIcons.rateStarUser,
                                              colorFilter:
                                              const ColorFilter.mode(
                                                  AppColors.orange,
                                                  BlendMode.srcIn),
                                            ),
                                          ),
                                          8.pw,
                                          Text(
                                            "4.8",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                              fontFamily: "Urbanist",
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      8.ph,
                                      Text(
                                        "HSW 4736 XK",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                          fontFamily: "Urbanist",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              24.ph,
                              const Divider(),
                              24.ph,
                              Text(
                                "Wow 5 Star!",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    fontFamily: "Urbanist",
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_900),
                              ),
                              12.ph,
                              Text(
                                "Do you want to add additional tip for Daniel?",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                    fontFamily: "Urbanist",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_700),
                              ),
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
                                              print(selectRate);
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
                                          ))
                                ],
                              ),
                              24.ph,
                              const Divider(),
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
