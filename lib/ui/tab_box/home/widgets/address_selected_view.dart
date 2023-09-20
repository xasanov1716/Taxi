import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/location_details/get_location_screen.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/size/screen_size.dart';
import '../../../widgets/global_button.dart';


class AddressSelectedView extends StatelessWidget {
  const AddressSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.w),
            topRight: Radius.circular(40.w),
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Distance",
                  style: TextStyle(fontSize: 24.spMin),
                ),
                const Spacer(),
                const Text("4.5 km")
              ],
            ),
            10.ph,
            const Divider(),
            ListTile(
              leading: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.gps,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              trailing: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.edit,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text("My Current Location"),
              subtitle: const Text("35 Oak Ave. Antioch, TN 37013"),
            ),
            10.ph,
            ListTile(
              leading: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.location,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              trailing: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.edit,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text("Soft Bank Buildings"),
              subtitle: const Text("26 State St. Daphne, AL 36526"),
            ),
            40.ph,
            GlobalButton(
              textColor: AppColors.black,
              color: AppColors.yellow,
              title: "Buyurtma berishda davom eting",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetLocationScreen(
                      text: 'Soft Bank',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
