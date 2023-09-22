import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/create_order/create_order_bloc.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({super.key});

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  bool selected = true;
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        centerTitle: false,
        title: "Add Promo",
        onTap: () {
          Navigator.pop(context);
        },
        action: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.search,
              colorFilter: ColorFilter.mode(
                getTheme(context) ? AppColors.white : AppColors.c_900,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
            itemCount: promoItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < promoItems.length; i++) {
                      promoItems[i].selected = (i == index);
                    }
                  });
                  selectedText = promoItems[index].text;
                  print(selectedText);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 24.h),
                  padding: EdgeInsets.only(top: 25.w, left: 24.h, right: 24.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(promoItems[index].icon),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            promoItems[index].text,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(promoItems[index].subtitle,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const Spacer(), // Push the radio button to the right edge
                      Radio(
                        activeColor: AppColors.primary,
                        fillColor: const MaterialStatePropertyAll(AppColors.primary),
                        value: index,
                        groupValue: promoItems[index].selected ? index : null,
                        onChanged: (value) {
                          setState(() {
                            for (int i = 0; i < promoItems.length; i++) {
                              promoItems[i].selected = (i == value);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
          Padding(
            padding: EdgeInsets.all(24.h),
            child: GlobalButton(
              title: 'Apply Promo',
              radius: 100.r,
              color: AppColors.primary,
              onTap: () {
                context
                    .read<CreateOrderBloc>()
                    .add(UpdatePromoCodes(promoCode: selectedText));
                Navigator.pop(context);
              },
            ),
          ),
          12.ph,
        ],
      ),
    );
  }
}

List<PromoItem> promoItems = [
  PromoItem(
      icon: AppIcons.yellowOffer,
      selected: false,
      text: "Special 25% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.blueOffer,
      selected: false,
      text: "Discount 30% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.greenOffer,
      selected: false,
      text: "Special 20% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.purpleOffer,
      selected: false,
      text: "Discount 40% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.redOffer,
      selected: false,
      text: "Discount 35% Off",
      subtitle: "Special promo only today!"),
];

class PromoItem {
  final String icon;
  bool selected;
  String text;
  String subtitle;

  PromoItem(
      {required this.icon,
      required this.selected,
      required this.text,
      required this.subtitle});
}
