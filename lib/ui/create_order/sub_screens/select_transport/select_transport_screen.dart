import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/create_order/create_order_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/choose_data.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/promos_button.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/select_transport_bottomsheet.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SelectTransportScreen extends StatefulWidget {
  const SelectTransportScreen({super.key});

  @override
  State<SelectTransportScreen> createState() => _SelectTransportScreenState();
}

class _SelectTransportScreenState extends State<SelectTransportScreen> {
  List<bool> selectedList = [false, false, false];
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {},
        title: "Select Car",
      ),
      backgroundColor: AppColors.greysCale,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              24.ph,
              Text(
                "Select the vehicle category you want to ride.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              24.ph,
              SizedBox(
                height: 350 * height / figmaHeight,
                child: ListView.builder(
                  itemCount: transportItem.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: 24.h, left: 24.w, right: 24.w),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < transportItem.length; i++) {
                              transportItem[i].selected = (i == index);
                            }
                          });
                        },
                        child: ChooseData(
                          icon: transportItem[index].icon,
                          text1: transportItem[index].type,
                          text2: transportItem[index].nearby,
                          text3: transportItem[index].price,
                          selected: transportItem[index].selected,
                          onSelect: (value) {
                            setState(() {
                              for (int i = 0; i < transportItem.length; i++) {
                                transportItem[i].selected = (i == index);
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.h, left: 24.h),
                child: Divider(),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: getTheme(context)
                                ? AppColors.dark2
                                : AppColors.c_50,
                          ),
                          child: Center(
                            child:
                                BlocBuilder<CreateOrderBloc, CreateOrderState>(
                              builder: (context, state) {
                                if (state.promoCodeList.isEmpty) {
                                  return Text(
                                    'Enter Promo Code',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.c_500,
                                        ),
                                  );
                                }
                                if (state.promoCodeList.isNotEmpty) {
                                  return Wrap(
                                    runSpacing: 10.h,
                                    spacing: 10.w,
                                    children: [
                                      ...List.generate(
                                        state.promoCodeList.length,
                                        (index) {
                                          var promoCode =
                                              state.promoCodeList[index];
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 8.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                              color: AppColors.primary,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  promoCode,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color: AppColors.dark3,
                                                      ),
                                                ),
                                                8.pw,
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<CreateOrderBloc>()
                                                        .add(ClearPromoCodes(
                                                            index: promoCode));
                                                  },
                                                  child: SvgPicture.asset(
                                                    AppIcons.getSvg(
                                                      name:
                                                          AppIcons.closeSquare,
                                                      iconType:
                                                          IconType.lightOutline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      20.pw,
                      getPlusButton(() {
                        Navigator.pushNamed(context, RouteNames.addPromo);
                        setState(() {});
                      }, context),
                    ],
                  )),
            ],
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: getTheme(context) ? AppColors.dark1 : AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    topLeft: Radius.circular(24.r),
                  ),
                  border: Border.all(color: AppColors.c_200, width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    24.ph,
                    Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: getTheme(context)
                            ? AppColors.dark2
                            : AppColors.c_100,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          getRow('4.5 km', AppIcons.location, context),
                          getRow('4 min', AppIcons.timeCircle, context),
                          getRow('\$20.00', AppIcons.wallet, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.h),
                child: GlobalButton(
                  title: 'Continue',
                  radius: 100.r,
                  color: AppColors.primary,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.paymentMethods);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

List<TransportItem> transportItem = [
  TransportItem(
      icon: AppIcons.premium,
      selected: false,
      type: "Bike",
      nearby: "9 nearbies",
      price: '10.00'),
  TransportItem(
      icon: AppIcons.standard,
      selected: false,
      type: "Standard",
      nearby: "9 nearbies",
      price: '20.00'),
  TransportItem(
      icon: AppIcons.premium,
      selected: false,
      type: "Premium",
      nearby: "4 nearbies",
      price: '30.00')
];

class TransportItem {
  final String icon;
  bool selected;
  String type;
  String nearby;
  String price;

  TransportItem(
      {required this.icon,
      required this.selected,
      required this.type,
      required this.price,
      required this.nearby});
}
