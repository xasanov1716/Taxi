import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import '../../widgets/empty.dart';
import '../../widgets/request_driver_view.dart';

class CancelledDriverRequest extends StatelessWidget {
  const CancelledDriverRequest({super.key, this.requestDrivers});
  final List<RequestModel>? requestDrivers;

  @override
  Widget build(BuildContext context) {
    return (requestDrivers != null && requestDrivers!.isNotEmpty) ? ListView.builder(
      itemCount: requestDrivers!.length,
      itemBuilder: (context, index) {
        return RequestDriverView(modelDriver: requestDrivers![index]);
      },
    ) : const EmptyBookings();
  }
}
