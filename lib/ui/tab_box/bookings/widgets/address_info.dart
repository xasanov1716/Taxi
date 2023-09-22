import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/booking/booking_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class BookingAddressInfo extends StatelessWidget {
  const BookingAddressInfo({super.key, required this.order});

  final BookingModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowMaker(context, order.currentLocTitle, order.currentLocStreet),
        24.ph,
        _rowMaker(context, order.arrivingLocTitle, order.arrivingLocStreet),
      ],
    );
  }

  _rowMaker(BuildContext context, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.dimYellow, width: 8.w),
            gradient: AppColors.gradientOrangeYellow,
            shape: BoxShape.circle,
          ),
          child:
              SvgPicture.asset(AppIcons.getSvg(name: AppIcons.currentLocation)),
        ),
        20.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            6.ph,
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: getTheme(context) ? AppColors.c_300 : AppColors.c_900),
            )
          ],
        )
      ],
    );
  }
}
