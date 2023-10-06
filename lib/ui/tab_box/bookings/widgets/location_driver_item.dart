import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_driver_address.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class LocationDriverItem extends StatelessWidget {
  const LocationDriverItem({
    super.key,
    required this.modelDriver,
    required this.expandTap,
    required this.mainButtonTap,
  });

  final RequestModel? modelDriver;
  final VoidCallback expandTap;
  final VoidCallback mainButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _rowMaker(
              context,
              AppIcons.getSvg(name: AppIcons.addUser, iconType: IconType.lightOutline),
              "Bo'sh joy: ${modelDriver!.passengerCount}",
            ),
            _rowMaker(
              context,
              AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
              "${modelDriver!.requestPrice} so'm",
            ),
          ],
        ),
        16.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Yo'lga chiqish vaqti",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
            ),
            Text(
              modelDriver!.tripTime,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: getTheme(context) ? AppColors.c_300 : AppColors.c_900),
            )
          ],
        ),
        16.ph,
        const Divider(),
        16.ph,
        RequestDriverAddress(modelDriver: modelDriver),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svg,
          colorFilter: ColorFilter.mode(
              getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
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
