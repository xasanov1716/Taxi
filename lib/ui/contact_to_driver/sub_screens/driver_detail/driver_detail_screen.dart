import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import 'widgets/icons_container/icons_container_screen.dart';
import 'widgets/screens_data/screen_data_screen.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        centerTitle: false,
        title: "Driver Details",
        action: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.moreCircle),
          ),
        ],
      ),
      // backgroundColor: AppColors.greysCale,
      body: Padding(
        padding: EdgeInsets.only(
            left: 24 * width / figmaWidth, right: 24 * width / figmaWidth),
        child: Column(
          children: [
            24.ph,
            Center(
                child: CircleAvatar(
              radius: 60.r,
              child: Image.asset(AppIcons.testAvatar),
            )),
            20.ph,
            Text('Daniel Austin',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                )),
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('+1-202-555-0161',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        )),
                IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.copy)),
              ],
            ),
            24.ph,
            ScreenData(column: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(children: [
                   IconsContainer(icon: AppIcons.getSvg(
                       name: AppIcons.star, iconType: IconType.bold), onTap: () {  },),
                   12.pw,
                   Text('4.8',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 18.sp,
                         fontWeight: FontWeight.w700,
                       )),
                   Text('Ratings',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 12.sp,
                         fontWeight: FontWeight.w400,
                       )),

                 ],),
                 32.pw,
                 Column(children: [
                   IconsContainer(icon:AppIcons.standard , onTap: () {  },),
                   Text('279',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 18.sp,
                         fontWeight: FontWeight.w700,
                       )),
                   Text('Trips',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 12.sp,
                         fontWeight: FontWeight.w400,
                       )),
                 ],),
                 32.pw,
                 Column(children: [
                   IconsContainer(icon: AppIcons.getSvg(
                       name: AppIcons.timeCircle, iconType: IconType.lightBorder), onTap: () {  },),
                   Text('5',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 18.sp,
                         fontWeight: FontWeight.w700,
                       )),
                   Text('Years',
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                         fontSize: 12.sp,
                         fontWeight: FontWeight.w400,
                       )),
                 ],),
               ],
             )
            ],), radius: 24.r, height: 170, width: 380,),
            24.ph,
            ScreenData(column: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Member Since',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    Text('July 15, 2019',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Car Model',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    Text('July 15, 2019',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Plate Number',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    Text('HSW 4736 XK',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ],),
              ],
            ), radius:15, height:163, width: 380,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 132 * height / figmaHeight,
        width: 428 * width / figmaWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          color: getTheme(context)? AppColors.dark2: AppColors.greysCale,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 24 * width / figmaWidth,
              right: 24 * width / figmaWidth,
              top: 24 * height / figmaHeight,
              bottom: 24 * height / figmaHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconsContainer(icon: AppIcons.getSvg(
                  name: AppIcons.chat, iconType: IconType.bold), onTap: () {  },),
              24.pw,
              IconsContainer(icon: AppIcons.getSvg(
                  name: AppIcons.call, iconType: IconType.bold), onTap: () {  },),
            ],
          ),
        ),
      ),
    );
  }
}
