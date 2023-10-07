import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/amount_buttons.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/amount_text_field.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../app_routes.dart';

class TopUpAmountScreen extends StatelessWidget {
  const TopUpAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: tr('top_up_e_wallet'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Center(
                      child: Text(tr('enter_the_amount'), style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  AmountTextField(
                    hintText: "",
                    maskFormatter: MaskTextInputFormatter(
                      mask: "\$###########",
                      filter: {"#": RegExp(r'[\d,.]')},
                    ),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                  ),
                  24.ph,
                  AmountButtons(controller: amountController),
                ],
              ),
            ),
            GlobalButton(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              title:tr('continue'),
              color: AppColors.primary,
              textColor: AppColors.dark3,
              radius: 100.r,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.topUpPaymentScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}