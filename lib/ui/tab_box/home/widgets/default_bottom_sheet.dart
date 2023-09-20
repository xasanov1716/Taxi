import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/select_transposrt_screen.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/saved_places.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/text_field_item.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/size/screen_size.dart';
import '../../../widgets/global_button.dart';
import '../location_details/get_location_screen.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      width: width,
      height: height / 7,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.w),
            topRight: Radius.circular(40.w),
          )),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.w),
          onTap: onTab,
          child: Ink(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: AppColors.c_100,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Where would you go?",
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9e9e9e),
                    height: 20 / 14,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.getSvg(
                    name: AppIcons.location,
                    iconType: IconType.bold,
                  ),
                  colorFilter: const ColorFilter.mode(
                    AppColors.c_500,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enterBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState){
        return Container(
          height: height / 1.2,
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
              children: <Widget>[
                30.ph,
                Center(
                  child: Text(
                    "Select Address",
                    style: TextStyle(color: Colors.black, fontSize: 24.spMin),
                  ),
                ),
                16.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: TextFieldItem(
                    hintText: "Form",
                    startIcon: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.discount,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    endIcon: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.gps,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                        AppColors.c_500,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                16.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: TextFieldItem(
                    hintText: "Destination",
                    startIcon: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.location,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    endIcon: SvgPicture.asset(
                      AppIcons.getSvg(
                        name: AppIcons.location,
                        iconType: IconType.bold,
                      ),
                      colorFilter: const ColorFilter.mode(
                        AppColors.c_500,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SavedPlaces(),
                Expanded(
                    child: ListView(
                  children: [
                    ...List.generate(
                        10,
                        (index) => const ListTile(
                              leading: Icon(Icons.watch_later_outlined),
                              trailing: Text(
                                "2.9 km",
                                style: TextStyle(color: Colors.black),
                              ),
                              title: Text("Eleonora Hotel"),
                              subtitle:
                                  Text("6 Glendale St. Worcester, MA 01604"),
                            ))
                  ],
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GlobalButton(
                      textColor: AppColors.black,
                      color: AppColors.primary,
                      title: "Keyingisi",
                      onTap: () {
                        Navigator.pop(context);
                        endBottomSheet(context);
                      }),
                ),
                16.ph
              ],
            ),
          ),
        );
      });
    },
  );
}

endBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
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
                        ));
                  }),
            ],
          ),
        ),
      );
    },
  );
}
