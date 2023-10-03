import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/top_up_button.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/top_up_payment_appbar.dart';
import 'package:taxi_app/ui/widgets/global_alert_dialog.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../data/models/payment/payment_model.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/theme/get_theme.dart';
import '../../../app_routes.dart';
import '../../../create_order/sub_screens/payment_methods/widgets/payment_item.dart';
import '../../../widgets/global_button.dart';

class TopUpPaymentScreen extends StatefulWidget {
  const TopUpPaymentScreen({super.key});

  @override
  State<TopUpPaymentScreen> createState() => _TopUpPaymentScreenState();
}

class _TopUpPaymentScreenState extends State<TopUpPaymentScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopUpPaymentAppbar(title: "Top Up E-Wallet"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Select the payment method you want to use.", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "Urbanist",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,),),
          ),
          13.ph,
          Expanded(child: ListView(
            children: [
              ...List.generate(payments.length-1, (index) => PaymentItem(paymentModel: payments[index+1], isSelected: index == selected, onTap: (){
                setState(() {
                  selected = index;
                });
              })),
              12.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: TopUpGlobalButton(
                  onTap: (){
                    // Navigator.pushNamed(context, RouteNames.enterPinScreen);
                  },title: "Add New Card", color: getTheme(context) ? AppColors.dark3 : const Color(0xFFFFF8E8) ,radius: 40.r, textColor: getTheme(context) ? AppColors.white : AppColors.dark3,),
              ),
            ],
          )),
          ClipRRect(
            child: Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 36.h),
              decoration: BoxDecoration(
                color: getTheme(context) ? AppColors.dark1 : AppColors.white,
                border: Border.all(width: 1, color: getTheme(context) ? AppColors.dark3 : AppColors.c_100),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
              ),
              child: GlobalButton(
                  onTap: (){
                    showGlobalAlertDialog(
                        context: context,
                        title: "Top Up Successful!",
                        image: AppIcons.successPassword,
                        text: "You have successfully top upe-wallet for \$120",
                        onTap: () {});
                // Navigator.pushNamed(context, RouteNames.enterPinScreen);
              },title: "Continue", color: AppColors.primary,radius: 40.r),
            ),
          )
        ],
      ),
    );
  }
}
