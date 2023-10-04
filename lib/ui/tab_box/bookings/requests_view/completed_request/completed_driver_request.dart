import 'package:flutter/material.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_driver_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_view.dart';
import '../../../../../data/models/request_model_driver/request_model_driver.dart';
import '../../widgets/empty.dart';

class CompletedDriverRequest extends StatelessWidget {
  const CompletedDriverRequest({super.key, this.requestDrivers});
  final List<RequestModelDriver>? requestDrivers;

  @override
  Widget build(BuildContext context) {
    return requestDrivers != null ? ListView.builder(
      itemCount: requestDrivers!.length,
      itemBuilder: (context, index) {
        return RequestDriverView(modelDriver: requestDrivers![index]);
      },
    ) : const EmptyBookings();
  }
}
