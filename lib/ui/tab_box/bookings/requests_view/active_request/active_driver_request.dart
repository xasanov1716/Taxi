import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import '../../widgets/empty.dart';
import '../../widgets/request_driver_view.dart';

class ActiveDriverRequest extends StatelessWidget {
  const ActiveDriverRequest({super.key, this.requestDrivers});
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