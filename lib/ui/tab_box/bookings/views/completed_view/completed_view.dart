import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/booking_details.dart';
import 'package:taxi_app/data/models/booking/booking_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/empty.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key, this.orders});

  final List<BookingModel>? orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: orders == null
          ? const EmptyBookings()
          : SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: orders!.length,
                itemBuilder: (context, index) {
                  return BookingDetails(order: orders![index]);
                },
              ),
            ),
    );
  }
}
