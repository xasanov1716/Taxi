import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/first_half_of_transport.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/second_half_of_transport.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/select_transport_functions.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({super.key});

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title:tr('select_car'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              FirstHalfOfTransport(),
              SecondHalfOfTransportScreen(),
            ],
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: getTheme(context) ? AppColors.dark1 : AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r),
              ),
              border: Border.all(color: getTheme(context) ? AppColors.dark3 : AppColors.c_200),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                24.ph,
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: getTheme(context) ? AppColors.dark2 : AppColors.c_100,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getRow('4.5 km', AppIcons.location, context),
                      getRow('4 min', AppIcons.timeCircle, context),
                      getRow('\$20.00', AppIcons.wallet, context),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: GlobalButton(
                    title: tr('continue'),
                    radius: 100.r,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.paymentMethods);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
