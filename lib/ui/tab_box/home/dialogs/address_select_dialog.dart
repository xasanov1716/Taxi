import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/saved_places.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/text_field_item.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/icon/icon_type.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../../utils/size/screen_size.dart';
import '../../../widgets/global_button.dart';

addressSelectDialog(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
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
                          subtitle: Text("6 Glendale St. Worcester, MA 01604"),
                        ),
                      )
                    ],
                  ),
                ),
                12.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GlobalButton(
                      textColor: AppColors.black,
                      color: AppColors.primary,
                      title: "Keyingisi",
                      onTap: () {
                        Navigator.pop(context);
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
