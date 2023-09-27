import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/icons/app_icons.dart';
import '../../../../../utils/theme/get_theme.dart';

class TransactionCategory extends StatefulWidget {
  const TransactionCategory({super.key});

  @override
  State<TransactionCategory> createState() => _TransactionCategoryState();
}

class _TransactionCategoryState extends State<TransactionCategory> {
  String selected = "Taxi Expense";
  List<String> priceTypes = [
    "Taxi Expense",
    "Expense",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: getTheme(context) ? AppColors.dark2 : AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Category",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxi Expense",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color:
                        getTheme(context) ? AppColors.c_100 : AppColors.c_800,
                    fontWeight: FontWeight.w600),
              ),
              12.pw,
              SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.arrowDown2,
                  iconType: IconType.lightOutline,
                ),
                colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn,
                ),
              )
            ],
          )

          ///Category ni selectorligi yoki data sifatida
          ///kelishi mumkinligi uchun bittasini commentga olib,
          ///hozircha Text()da berib qo'ydim
          // DropdownButton<String>(
          //   value: selected,
          //   onChanged: (newValue) {
          //     setState(() {
          //       selected = newValue!;
          //     });
          //   },
          //   items: priceTypes.map((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
