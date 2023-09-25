import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/payment_add/payment_add_bloc.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/payment_add_card_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/widgets/payment_container.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class PaymentsListScreen extends StatefulWidget {
  const PaymentsListScreen({super.key});

  @override
  State<PaymentsListScreen> createState() => _PaymentsListScreenState();
}

class _PaymentsListScreenState extends State<PaymentsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: GlobalAppBar(
          title: 'Payment',
          action: [
            getIcon(AppIcons.moreCircle, context: context, onTap: () {}),
          ],
        ),
        body: BlocBuilder<PaymentAddBloc, PaymentAddState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      12.ph,
                      ...List.generate(
                          state.cards.length,
                          (index) => PaymentContainer(
                              icon: state.cards[index].paymentIcon,
                              title: state.cards[index].title,
                              state: "Connected"))
                    ],
                  ),
                ),
                GlobalButton(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PaymentAddCardScreen();
                    }));
                  },
                  title: 'Add New Card',
                  color: AppColors.primary,
                  radius: 100,
                ),
                48.ph
              ],
            );
          },
        ));
  }
}
