import 'package:flutter/material.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/request_view.dart';
import '../../../../../data/models/request_model_client/request_model_client.dart';
import '../../widgets/empty.dart';

class CompletedRequestView extends StatelessWidget {
  const CompletedRequestView({super.key, this.requestClients});
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
