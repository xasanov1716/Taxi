import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/create_order/create_order_bloc.dart';
import 'package:taxi_app/data/models/promo/promo_model.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

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
        title: tr('add_promo'),
        onTap: () {
          Navigator.pop(context);
        },
        action: [
          getIcon(AppIcons.search, context: context, onTap: (){})
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
          GlobalButton(
            padding:  EdgeInsets.all(24.h),
            title: tr('apply_promo'),
            radius: 100.r,
            color: AppColors.primary,
            onTap: () {
              context
                  .read<CreateOrderBloc>()
                  .add(UpdatePromoCodes(promoCode: selectedText));
              Navigator.pop(context);
            },
          ),
          12.ph,
        ],
      ),
    );
  }
}

