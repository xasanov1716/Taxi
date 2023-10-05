import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/status_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SelectRequestClient extends StatefulWidget {
  const SelectRequestClient({super.key, this.modelClient});

  final RequestModel? modelClient;

  @override
  State<SelectRequestClient> createState() => _SelectRequestClientState();
}

class _SelectRequestClientState extends State<SelectRequestClient> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        duration: const Duration(milliseconds: 700),
        curve: Curves.linear,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        child: Column(
          children: [
            Row(
              children: [
                12.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.modelClient!.creatorName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    6.ph,
                    Text(
                      widget.modelClient!.description,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: getTheme(context)
                              ? AppColors.c_300
                              : AppColors.c_700),
                    )
                  ],
                ),
                const Spacer(),
                const Column(
                  children: [
                    BookingStatusButton(status: BookingStatus.active)
                  ],
                )
              ],
            ),
            16.ph,
            Column(
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
                      "Bo'sh joy: ${widget.modelClient!.passengerCount}",
                    ),
                    _rowMaker(
                      context,
                      AppIcons.getSvg(name: AppIcons.wallet, iconType: IconType.curved),
                      "${widget.modelClient!.requestPrice} so'm",
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
                          color: getTheme(context) ? AppColors.c_300 : AppColors.c_700),
                    ),
                    Text(
                      widget.modelClient!.tripTime,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: getTheme(context) ? AppColors.c_300 : AppColors.c_900),
                    )
                  ],
                ),
                16.ph,
                const Divider(),
              ],
            ),
          ],
        ),
      ),
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
