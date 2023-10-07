import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/empty.dart';

class ActiveRequestView extends StatelessWidget {
  const ActiveRequestView({super.key, this.requestClients});
  final List<RequestModel>? requestClients;

  @override
  Widget build(BuildContext context) {
    return (requestClients != null && requestClients!.isNotEmpty)
        ? ListView.builder(
            itemCount: requestClients!.length,
            itemBuilder: (context, index) {
              return RequestView(modelClient: requestClients![index]);
            },
          )
        : const EmptyBookings();
  }
}
