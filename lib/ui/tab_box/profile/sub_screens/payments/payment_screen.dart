import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/widgets/payment_container.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class PaymentsListScreen extends StatelessWidget {
  const PaymentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<List> payments = [
      [AppIcons.payPal, 'PayPal', 'Connected'],
      [AppIcons.googlePay, 'Google Pay', 'Connected'],
      [AppIcons.applePay, 'Apple Pay', 'Connected'],
      [AppIcons.masterCard, 'masterCard', 'Connected'],
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: GlobalAppBar(
        title: 'Payment',
        action: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AppIcons.moreCircle))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                12.ph,
                ...List.generate(
                    payments.length,
                    (index) =>
                        PaymentContainer(icon: payments[index][0], title: payments[index][1], state: payments[index][2]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GlobalButton(onTap: () {
              Navigator.pushNamed(context, RouteNames.paymentAddCard);
            },title: 'Add New Card',color: AppColors.primary,radius: 100,),
          ),
          48.ph
        ],
      ),
    );
  }
}
