import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/detailed_price.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/detailed_transaction_of_user.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/payment_methods.dart';
import 'package:taxi_app/ui/tab_box/wallet/sub_screens/widgets/transaction_category.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class TransactionDetailScreen extends StatefulWidget {
  const TransactionDetailScreen({super.key});

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: tr('e_receipt'),
        action: [
          IconButton(
            onPressed: () {

            },
            icon: SvgPicture.asset(
              AppIcons.getSvg(
                  name: AppIcons.moreCircle, iconType: IconType.lightOutline),
              colorFilter: ColorFilter.mode(
                getTheme(context) ? AppColors.white : AppColors.c_900,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          24.ph,
          Image.asset(
              getTheme(context) ? AppIcons.eReceiptDark : AppIcons.eReceipt),
          const DetailedTransactionOfUser(),
          const DetailedTransactionPrice(),
          DetailedPaymentMethods(
            onCopyTap: () {},
          ),
          const TransactionCategory(),
        ],
      ),
    );
  }
}
