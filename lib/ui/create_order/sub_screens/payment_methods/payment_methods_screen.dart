import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/payment_methods/widgets/payment_appbar.dart';
import 'package:taxi_app/ui/create_order/sub_screens/payment_methods/widgets/payment_item.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import '../../../../utils/colors/app_colors.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PaymentAppbar(onTap: (){}),
      body: Column(
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
              ...List.generate(payments.length, (index) => PaymentItem(paymentModel: payments[index], isSelected: index == selected, onTap: (){
                setState(() {
                  selected = index;
                });
              }))
            ],
          )),
          ClipRRect(
            child: Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 36.h),
              decoration: BoxDecoration(
                color: getTheme(context) ? AppColors.dark1 : AppColors.white,
                border: Border(top: BorderSide(style: BorderStyle.solid,width: 1, color: getTheme(context) ? AppColors.dark3 : AppColors.c_100)),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
              ),
              child: GlobalButton(
                  onTap: (){
                    Navigator.pushNamed(context, RouteNames.searchingDriver);
                  },
                  title: "Continue", color: AppColors.primary,
                  radius: 100.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
