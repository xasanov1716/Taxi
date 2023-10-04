import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
class RequestAddress extends StatefulWidget {
  const RequestAddress({super.key, this.modelClient});

  final RequestModelClient? modelClient;

  @override
  State<RequestAddress> createState() => _RequestAddressState();
}

class _RequestAddressState extends State<RequestAddress> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowMaker(context, "Toshkent shahri"),
        24.ph,
        _rowMaker(context, "Samarqand shahri"),
      ],
    );
  }

  _rowMaker(BuildContext context, String title) {
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
          ],
        )
      ],
    );
  }
}
