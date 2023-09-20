import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/choose_data.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/select_transport_bottomsheet.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SelectDriverScreen extends StatefulWidget {
  const SelectDriverScreen({super.key});

  @override
  State<SelectDriverScreen> createState() => _SelectDriverScreenState();
}

class _SelectDriverScreenState extends State<SelectDriverScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {},
        title: "Select Car",
      ),
      backgroundColor: AppColors.greysCale,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    24.ph,
                    Text("Select the vehicle category you want to ride.",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    24.ph,
                    const ChooseData(
                      icon: AppIcons.bike,
                      text1: 'Bike',
                      text2: '7 nearbies',
                      text3: '10.00',

                    ),
                    24.ph,
                    const ChooseData(
                      icon: AppIcons.standard,
                      text1: 'Standard',
                      text2: '9 nearbies',
                      text3: '20.00',

                    ),
                    24.ph,
                    const ChooseData(
                      icon: AppIcons.premium,
                      text1: 'Premium',
                      text2: '4 nearbies',
                      text3: '30.00',

                    ),

                  ],
                ),
              ],
            ),
          ),
          SelectTransPrtBottomSheet(),
        ],
      ),
    );
  }
}
