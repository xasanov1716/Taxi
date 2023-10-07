import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/data/models/address_model/address_model.dart';
import 'package:taxi_app/data/repositories/address_repos.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/address/widgets/address_item.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
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
      body: StreamBuilder<List<AddressModel>>(
        stream: context.read<AddressRepo>().getAddresses(),
        builder: (BuildContext context, AsyncSnapshot<List<AddressModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          AddressModel addressModel = snapshot.data![index];
                          return AddressItem(
                              image: AppIcons.locationInSearchDb,
                              title: addressModel.addressText,
                              subtitle: addressModel.apartment,
                              onTap: () {
                                Navigator.pushNamed(context, RouteNames.addAddressScreen,
                                    arguments: addressModel);
                              });
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: AppColors.c_200,
                            endIndent: 24.w,
                            indent: 24.w,
                          );
                        },
                      )),
                      GlobalButton(
                        padding: EdgeInsets.all(24.h),
                        title: 'Add New Address',
                        radius: 100.r,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.addAddressScreen);
                        },
                      ),
                      24.ph,
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                          child: Center(
                              child: Lottie.asset(AppIcons.emptyLottie,
                                  width: 350 * height / figmaHeight))),
                      GlobalButton(
                        padding: EdgeInsets.all(24.h),
                        title: 'Add New Address',
                        radius: 100.r,
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.addAddressScreen);
                        },
                      ),
                      24.ph,
                    ],
                  );
          }
          if (snapshot.hasError) {
            return Center(
              child: Image.asset(AppIcons.emptyBookings),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
