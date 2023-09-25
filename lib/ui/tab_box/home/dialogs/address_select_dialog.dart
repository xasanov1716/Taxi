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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
    context: context,
    showDragHandle: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: height / 1.4,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.w),
                topRight: Radius.circular(40.w),
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "Select Address",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const Divider(),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: TextFieldItem(
                    hintText: "Form",
                    startIcon: SvgPicture.asset(
                      AppIcons.getSvg(name: AppIcons.circle),
                      width: 24.w,
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
                Row(
                  children: [
                    35.pw,
                    Container(height: 30.h,width:1.w,color: Theme.of(context).hintColor),
                    const Spacer(),
                  ],
                ),
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
                        (index) => ListTile(
                          leading: const Icon(Icons.watch_later_outlined),
                          trailing: Text(
                            "2.9 km",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          title: const Text("Eleonora Hotel"),
                          subtitle: const Text("6 Glendale St. Worcester, MA 01604"),
                        ),
                      )
                    ],
                  ),
                ),
                12.ph,
                GlobalButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    textColor: AppColors.black,
                    color: AppColors.primary,
                    title: "Keyingisi",
                    onTap: () {
                      Navigator.pop(context);
                    }),
                16.ph
              ],
            ),
          ),
        );
      });
    },
  );
}
