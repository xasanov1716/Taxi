import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/address_item.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../../data/models/address/address_model.dart';


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
              return AddressItem(image: AppIcons.locationInSearchDb, title: addressModel.name, subtitle: addressModel.appartment, onTap: (){});
            }, separatorBuilder: (BuildContext context, int index) { 
              return Divider(
                color: AppColors.c_200,
                endIndent: 32.w,
                indent: 28.w,
              );
             },
          )),
          Padding(
            padding: EdgeInsets.all(24.h),
            child: GlobalButton(
              title: 'Add New Address',
              radius: 100.r,
              color: AppColors.primary,
              onTap: () {

              },
            ),
          ),
          24.ph,
        ],
      ),
    );
  }
}