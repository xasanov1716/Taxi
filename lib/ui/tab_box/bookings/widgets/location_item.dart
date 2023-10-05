import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_address.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import '../../../../utils/icons/app_icons.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.modelClient,
    required this.expandTap,
    required this.mainButtonTap,
  });

  final RequestModel? modelClient;
  final VoidCallback expandTap;
  final VoidCallback mainButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _rowMaker(
              context,
              AppIcons.getSvg(
                  name: AppIcons.addUser, iconType: IconType.lightOutline),
              "Yo'lovchi:  ${modelClient!.passengerCount}",
            ),
            _rowMaker(
              context,
              AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
              "${modelClient!.requestPrice} so'm",
            ),
          ],
        ),
        16.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Yo'lga chiqish vaqti",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18.sp,
                  color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
            ),
            Text(
              modelClient!.tripTime,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18.sp,
                  color: getTheme(context) ? AppColors.c_300 : AppColors.c_900),
            )
          ],
        ),
        16.ph,
        const Divider(),
        16.ph,
        RequestAddress(modelClient: modelClient),
        16.ph,
        BookingExpanderButton(
          expandTap: expandTap,
          isExpanded: true,
        )
      ],
    );
  }

  _rowMaker(BuildContext context, String svg, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svg,
          colorFilter: ColorFilter.mode(
              getTheme(context) ? AppColors.white : AppColors.c_900,
              BlendMode.srcIn),
        ),
        8.pw,
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
