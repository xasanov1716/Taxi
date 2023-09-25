import 'package:flutter/material.dart';
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
        title: 'Transaction History',
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
              onTap: () {},
              transactionModel: TransactionModel(
                name: "Daniel Austin",
                date: "Dec 20, 2024 | 10:00 AM",
                price: 14,
                expense: "Taxi Expense",
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
