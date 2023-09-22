import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/address/address_model.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/address_details_controller.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/name_address_container.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ShowModalBottomSheetAddressAddScreen extends StatelessWidget {
  const ShowModalBottomSheetAddressAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding:
            EdgeInsets.only(top: 8.h, bottom: 48.h, left: 24.w, right: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            8.ph,
            Center(
              child: SizedBox(
                  width: 38.w,
                  child: Divider(
                    height: 3,
                    color: Theme.of(context).secondaryHeaderColor,
                  )),
            ),
            24.ph,
            Center(
              child: Text(
                "Address Details",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            24.ph,
            const Divider(),
            24.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            16.ph,
            NameAddressContainer(
              text: "Apartment",
              color: getTheme(context) ? AppColors.dark2 : AppColors.c_50,
            ),
            24.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Details",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            16.ph,
            AddressDetailController(
                text: "931 Ine Taylor931 Indian Summer Drive Taylor, MI 48180",
                color: getTheme(context) ? AppColors.dark2 : AppColors.c_50,
                iconButton: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      AppIcons.location,
                      colorFilter: ColorFilter.mode(
                          getTheme(context) ? AppColors.c_50 : AppColors.c_50,
                          BlendMode.srcIn),
                    )),
                onTap: () {}),
            24.ph,
            GlobalButton(
              title: "Add Adress",
              onTap: () {
                AddressModel addressModel = AddressModel(
                    name: "name",
                    appartment: "appartment",
                    lat: 51.2,
                    long: 47.2);
                addres.add(addressModel);
              },
              radius: 100,
              color: AppColors.primaryBackground,
            )
          ],
        ),
      ),
    );
  }
}
