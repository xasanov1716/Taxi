import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/blocs/payment/payment_bloc.dart';
import 'package:taxi_app/blocs/payment_add/payment_add_bloc.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/payment_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/payments/widgets/payment_text_field.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

import '../../../../widgets/global_button.dart';

class PaymentAddCardScreen extends StatelessWidget {
  const PaymentAddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppIcons.arrowLeft,
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.black,
                  BlendMode.srcIn),
            ),
          ),
          title: Text("Add New Card",
              style: Theme.of(context).appBarTheme.titleTextStyle),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.moreCircle,
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.black,
                    BlendMode.srcIn),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                children: [
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: const Color(0xFFFEBB1B),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  state.cardName.isEmpty
                                      ? Text(
                                          "Card Name",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp,
                                                  fontFamily: "Urbanist"),
                                        )
                                      : Text(
                                          state.cardName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp,
                                                  fontFamily: "Urbanist"),
                                        ),
                                  Text(
                                    state.cardNumber.startsWith('8600')
                                        ? "UzCard"
                                        : state.cardNumber.startsWith('9860')
                                        ? "Humo"
                                        : 'Card Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            fontFamily: "Urbanist"),
                                  ),
                                ],
                              ),
                              24.ph,
                              state.cardNumber.isEmpty
                                  ? Text(
                                      "•••• •••• •••• ••••",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 48.sp,
                                              fontFamily: "Urbanist"),
                                    )
                                  : Text(
                                      state.cardNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30.sp,
                                              fontFamily: "Urbanist"),
                                    ),
                              24.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Card Holder name",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            fontFamily: "Urbanist"),
                                  ),
                                  Text(
                                    "Expiry date",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            fontFamily: "Urbanist"),
                                  ),
                                  SvgPicture.asset(AppIcons.masterCard)
                                ],
                              ),
                              4.ph,
                              Row(
                                children: [
                                  Text(
                                    "•••• ••••",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            fontFamily: "Urbanist"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "••••/••••",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            fontFamily: "Urbanist"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  24.ph,
                  PaymentTextField(
                    textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      maskFormatter: MaskTextInputFormatter(
                        mask: '################',
                        filter: {"#": RegExp(r'[a-zA-z]')},
                      ),
                      text: "Card Name",
                      hintText: "Card Name",
                      onChanged: (value) {
                        context
                            .read<PaymentBloc>()
                            .add(CardName(cardName: value));
                      }),
                  24.ph,
                  PaymentTextField(
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    maskFormatter: MaskTextInputFormatter(
                      mask: '#### #### #### ####',
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
                    text: "Card Number",
                    hintText: "1234 5678 1234 5678",
                    onChanged: (value) {
                      context
                          .read<PaymentBloc>()
                          .add(CardNumber(cardNumber: value));
                    },
                  ),
                  24.ph,
                  PaymentTextField(
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    maskFormatter: MaskTextInputFormatter(
                      mask: "##/##",
                      filter: {"#": RegExp(r'[0-9]')},
                    ),
                    text: "Expiry Date",
                    hintText: "01/01",
                    onChanged: (value) {
                      context
                          .read<PaymentBloc>()
                          .add(CardNumber(cardNumber: value));
                    },
                  ),
                ],
              ),
            ),
            GlobalButton(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              onTap: () {
                // context.read<PaymentAddBloc>().add(AddCards(
                //     name: PaymentModel(
                //         paymentIcon: AppIcons.masterCard,
                //         price: 100)));
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PaymentsListScreen();
                }));
              },
              title: 'Add New Card',
              color: AppColors.primary,
              radius: 100,
            ),
            48.ph
          ],
        ));
  }

}
