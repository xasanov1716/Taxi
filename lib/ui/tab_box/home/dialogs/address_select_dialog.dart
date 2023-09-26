import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/home/dialogs/widgets/address_select_item_padding.dart';
import 'package:taxi_app/ui/tab_box/home/dialogs/widgets/address_selection_dialog_list_view.dart';
import 'package:taxi_app/ui/tab_box/home/widgets/saved_places.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

addressSelectDialog(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
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
                AddressSelectionItem(
                  hintText: "Form",
                  startIconName: AppIcons.getSvg(name: AppIcons.circle),
                  endIconName: AppIcons.getSvg(
                    name: AppIcons.gps,
                    iconType: IconType.bold,
                  ),
                ),
                Row(
                  children: [
                    35.pw,
                    Container(
                        height: 30.h,
                        width: 1.w,
                        color: Theme.of(context).hintColor),
                    const Spacer(),
                  ],
                ),
                AddressSelectionItem(
                  hintText: "Destination",
                  startIconName: AppIcons.getSvg(
                    name: AppIcons.location,
                    iconType: IconType.bold,
                  ),
                  endIconName: AppIcons.getSvg(
                    name: AppIcons.location,
                    iconType: IconType.bold,
                  ),
                ),
                const SavedPlaces(),
                const AddressSelectionDialogListView(),
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
