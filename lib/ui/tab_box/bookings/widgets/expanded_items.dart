import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/booking/booking_model.dart';
import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/address_info.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import '../../../../utils/icons/app_icons.dart';

class BookingExpandedItems extends StatelessWidget {
  const BookingExpandedItems({
    super.key,
    required this.order,
    required this.expandTap,
    required this.mainButtonTap,
  });

  final BookingModel order;
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
                  name: AppIcons.location, iconType: IconType.curved),
              "${order.distance} km",
            ),
            _rowMaker(
              context,
              AppIcons.getSvg(
                  name: AppIcons.timeCircle, iconType: IconType.lightOutline),
              "${order.duration} min",
            ),
            _rowMaker(
              context,
              AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
              "\$${order.payment.price}",
            ),
          ],
        ),
        16.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date & Time",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
            ),
            Text(
              order.date,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: getTheme(context) ? AppColors.c_300 : AppColors.c_900),
            )
          ],
        ),
        16.ph,
        const Divider(),
        16.ph,
        BookingAddressInfo(order: order),
        16.ph,
        order.status == BookingStatus.active
            ? SizedBox(
                width: 332 * width / figmaWidth,
                height: 140 * height / figmaHeight,
                child: Image.asset(AppIcons.mapAtBooking))
            : const SizedBox(),
        16.ph,
        order.status == BookingStatus.active
            ? SizedBox(
                width: 332 * width / figmaWidth,
                height: 32 * height / figmaHeight,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Track Driver",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.dark3),
                    )),
              )
            : SizedBox(),
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
