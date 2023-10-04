import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/booking/booking_status.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/location_driver_item.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/status_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class RequestDriverView extends StatefulWidget {
  const RequestDriverView({super.key, this.modelDriver});

  final RequestModelDriver? modelDriver;

  @override
  State<RequestDriverView> createState() => _RequestDriverViewState();
}

class _RequestDriverViewState extends State<RequestDriverView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        duration: const Duration(milliseconds: 700),
        curve: Curves.linear,
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Row(
              children: [
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dilshodbek",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    6.ph,
                    Text(
                      widget.modelDriver!.description,
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
            const Divider(),
            isExpanded
                ? LocationDriverItem(
              modelDriver: widget.modelDriver,
              expandTap: () {
                setState(() {
                  isExpanded = false;
                });
              },
              mainButtonTap: () {},
            )
                : BookingExpanderButton(
                isExpanded: isExpanded,
                expandTap: () {
                  setState(() {
                    isExpanded = true;
                  });
                })
          ],
        ),
      ),
    );
  }
}
