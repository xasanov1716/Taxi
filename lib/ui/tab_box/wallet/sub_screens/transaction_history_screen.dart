import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/transaction_item.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

import '../../../../data/models/transaction/transaction_model.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: tr('transaction_history'),
        action: [
          getIcon(
            AppIcons.search,
            context: context,
            onTap: () {},
          ),
          12.pw
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            100,
            (index) => TransactionItem(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.transactionsDetail);
              },
              transactionModel: TransactionModel(
                name: "Daniel Austin",
                date: "Dec 20, 2024 | 10:00 AM",
                price: 14,
                expense: tr('taxi_expense'),
                iconName: AppIcons.arrowUpSquare,
                iconColor: AppColors.error,
              ),
            ),
          )

        ],
      ),
    );
  }
}
