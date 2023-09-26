import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class AddressSelectedView extends StatelessWidget {
  const AddressSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
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
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              trailing: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.edit,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
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
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              trailing: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.edit,
                  iconType: IconType.bold,
                ),
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text("Soft Bank Buildings"),
              subtitle: const Text("26 State St. Daphne, AL 36526"),
            ),
            40.ph,
            GlobalButton(
              textColor: AppColors.dark2,
              color: AppColors.primary,
              radius: 100.r,
              title: "Buyurtma berishda davom eting",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.selectTransportScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
