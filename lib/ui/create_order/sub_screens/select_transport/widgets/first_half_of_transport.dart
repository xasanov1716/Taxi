import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/choose_data.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class FirstHalfOfTransport extends StatefulWidget {
   const FirstHalfOfTransport({super.key});

  @override
  State<FirstHalfOfTransport> createState() => _FirstHalfOfTransportState();
}

class _FirstHalfOfTransportState extends State<FirstHalfOfTransport> {
  List<bool> selectedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 400 * height / figmaHeight,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ...List.generate(
                selectedList.length,
                    (index) => Padding(
                  padding: EdgeInsets.only(
                       left: 24.w, right: 24.w),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.h, left: 24.h, ),
                child: Divider(color: getTheme(context)?AppColors.dark3: AppColors.c_200,),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.h, left: 24.h,bottom: 24.h),
                child: Text("Promo Code",style: Theme.of(context).textTheme.titleLarge,),
              ),
            ],
          ),
        ),
      ],
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
      icon: AppIcons.standart,
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