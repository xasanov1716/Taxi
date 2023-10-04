import 'package:flutter/material.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_view.dart';
import '../../../../../data/models/request_model_client/request_model_client.dart';
import '../../../../../data/models/request_model_driver/request_model_driver.dart';
import '../../widgets/empty.dart';
import '../../widgets/request_driver_view.dart';

class CancelledDriverRequest extends StatelessWidget {
  const CancelledDriverRequest({super.key, this.requestDrivers});
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
