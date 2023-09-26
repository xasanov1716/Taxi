import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/address/address_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/address_item.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';



class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Address',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
            itemCount: addres.length,
            itemBuilder: (context, index) {
              AddressModel addressModel = addres[index];
              return AddressItem(image: AppIcons.locationInSearchDb, title: addressModel.street, subtitle: addressModel.apartment, onTap: (){});
            }, separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.c_200,
                endIndent:24.w,
                indent: 24.w,
              );
             },
          )),
          GlobalButton(
            padding: EdgeInsets.all(24.h),
            title: 'Add New Address',
            radius: 100.r,
            color: AppColors.primary,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.addressAddDetailScreen);

            },
          ),
          24.ph,
        ],
      ),
    );
  }
}