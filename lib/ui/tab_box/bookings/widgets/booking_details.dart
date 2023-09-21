import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/booking/booking_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expander_button.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/expanded_items.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/status_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key, required this.order});

  final BookingModel order;

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.linear,
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 60 * width / figmaWidth,
                height: 60 * height / figmaHeight,
                child: Center(
                  child: Image.asset(
                    widget.order.avatar,
                  ),
                ),
              ),
              20.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.order.driverName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  6.ph,
                  Text(
                    widget.order.carName,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BookingStatusButton(status: widget.order.status),
                  8.ph,
                  Text(
                    widget.order.carNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
          16.ph,
          const Divider(),
          isExpanded
              ? BookingExpandedItems(
                  order: widget.order,
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
    );
  }
}
