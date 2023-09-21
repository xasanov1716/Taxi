import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/tab_box/home/notification/widgets/global_notification_container.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        title: Text(
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
                      height: height / 1.2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            Text(
                              "Your Mood",
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
                            // GlobalNotificationContainer(title: "Daniel Austin", text: "Mercedes-Benz E-Class", icon: AppIcons.profile)
                            Row(
                              children: [
                                Image.asset(AppIcons.testAvatar,
                                    width: 60.w, height: 60.h),
                                20.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Daniel Austin",
                                          style: Theme.of(context)
                                              .dialogTheme
                                              .titleTextStyle
                                              ?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: getTheme(context)
                                                      ? AppColors.white
                                                      : AppColors.c_900),
                                        ),
                                        SvgPicture.asset(AppIcons.starPrimary)
                                      ],
                                    ),
                                    8.ph,
                                    Text(
                                      "Mercedes-Benz E-Class",
                                      style: Theme.of(context)
                                          .dialogTheme
                                          .titleTextStyle
                                          ?.copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: getTheme(context)
                                              ? AppColors.white
                                              : AppColors.c_900),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
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
