import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/models/booking/booking_model.dart';
import '../../widgets/booking_details.dart';
import '../../widgets/empty.dart';

class CancelledView extends StatelessWidget {
  const CancelledView({super.key, this.orders});

  final List<BookingModel>? orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: orders == null
          ? const EmptyBookings()
          : ListView.builder(
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                return BookingDetails(order: orders![index]);
              },
            ),
    );
  }
}
