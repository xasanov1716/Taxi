import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/card_item.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/transaction_item.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/wallet_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../utils/size/screen_size.dart';
import '../../../utils/theme/get_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WalletAppbar(
        title: "My E-Wallet",
        onTap: () {},
        searchTap: () {},
      ),
      body: Column(
        children: [
          CardItem(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.topUpAmountScreen);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Text(
                  "Transaction History",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.transactionsHistory,
                      );
                    },
                    child: Text("See All",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary))),
              ],
            ),
          ),
          12.ph,
          Expanded(
              child: ListView(
            children: [
              TransactionItem(
                onTap: () {},
                name: "Daniel Austin",
                date: "Dec 20, 2024 | 10:00 AM",
                price: 14,
                expense: "Taxi Expense",
                iconName: AppIcons.arrowUpSquare,
                iconColor: AppColors.error,
              ),
              TransactionItem(
                onTap: () {},
                name: "Top Up Wallet",
                date: "Dec 16, 2024 | 16:42 PM",
                price: 80,
                expense: "Top Up",
                iconName: AppIcons.arrowDownSquare,
                iconColor: AppColors.info,
              ),
              TransactionItem(
                onTap: () {},
                name: "Daniel Austin",
                date: "Dec 20, 2024 | 10:00 AM",
                price: 14,
                expense: "Taxi Expense",
                iconName: AppIcons.arrowUpSquare,
                iconColor: AppColors.error,
              ),
              TransactionItem(
                onTap: () {},
                name: "Daniel Austin",
                date: "Dec 20, 2024 | 10:00 AM",
                price: 14,
                expense: "Taxi Expense",
                iconName: AppIcons.arrowUpSquare,
                iconColor: AppColors.error,
              ),
              TransactionItem(
                onTap: () {},
                name: "Top Up Wallet",
                date: "Dec 16, 2024 | 16:42 PM",
                price: 80,
                expense: "Top Up",
                iconName: AppIcons.arrowDownSquare,
                iconColor: AppColors.info,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
