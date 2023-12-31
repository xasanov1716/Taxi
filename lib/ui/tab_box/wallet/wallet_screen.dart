import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/transaction/transaction_model.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/card_item.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/transaction_item.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/transaction_persistent_header.dart';
import 'package:taxi_app/ui/tab_box/wallet/widgets/wallet_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WalletAppbar(
        title: tr('my_e_wallet'),
        onTap: () {},
        searchTap: () {},
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            expandedHeight: 320 * height / figmaHeight,
            collapsedHeight: 86,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    CardItem(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.topUpAmountScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TransactionPersistentHeader(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.transactionsHistory,
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                12.ph,
                ...List.generate(
                  15,
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
          ),
        ],
      ),
    );
  }
}
