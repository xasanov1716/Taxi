import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/third_item/third_Item_in_driver_detail.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/third_item/third_item_container.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import 'widgets/icons_container/icons_container_screen.dart';
import 'widgets/second_item/second_item_container.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
            icon: SvgPicture.asset(AppIcons.moreCircle, colorFilter: ColorFilter.mode(getTheme(context)?AppColors.white:AppColors.c_900, BlendMode.srcIn),),
          ),
        ],
      ),
      // backgroundColor: AppColors.greysCale,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * width / figmaWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: CircleAvatar(
              radius: 60.r,
              child: Image.asset(AppIcons.testAvatar),
            )),
            Text('Daniel Austin',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('+1-202-555-0161',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        )),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppIcons.copy)),
              ],
            ),
            const SecondItemContainer(),
            const ThirdItemContainer(),
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
          color: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            24 * height / figmaHeight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconsContainer(
                icon: AppIcons.getSvg(
                    name: AppIcons.chat, iconType: IconType.bold),
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.chatWithDriver);
                },
              ),
              24.pw,
              IconsContainer(
                icon: AppIcons.getSvg(
                    name: AppIcons.call, iconType: IconType.bold),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
