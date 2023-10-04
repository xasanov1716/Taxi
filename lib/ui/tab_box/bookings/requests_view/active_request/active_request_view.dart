import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_view.dart';
import '../../widgets/empty.dart';

class ActiveRequestView extends StatelessWidget {
  const ActiveRequestView({super.key, this.requestClients});
  final List<RequestModelClient>? requestClients;

  @override
  Widget build(BuildContext context) {
    return requestClients != null
        ? ListView.builder(
      itemCount: requestClients!.length,
      itemBuilder: (context, index) {
        return RequestView(modelClient: requestClients![index]);
      },
    ) : const EmptyBookings();
  }
}