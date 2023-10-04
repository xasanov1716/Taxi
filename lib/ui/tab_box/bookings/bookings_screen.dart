import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/repositories/request_client_repo.dart';
import 'package:taxi_app/data/repositories/request_driver_repo.dart';
import 'package:taxi_app/ui/tab_box/bookings/requests_view/active_request/active_driver_request.dart';
import 'package:taxi_app/ui/tab_box/bookings/requests_view/active_request/active_request_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/requests_view/cancelled_request/cancelled_request_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/requests_view/completed_request/completed_request_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/booking_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: BookingAppBar(
          title: "My bookings",
          moreOnTap: () {},
          searchOnTap: () {},
        ),
        body: StorageRepository.getString(StorageKeys.userRole) != "client"
            ? StreamBuilder<List<RequestModel>>(
          stream: context.read<RequestClientRepo>().getClientRequest(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RequestModel>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? TabBarView(children: <Widget>[
                ActiveDriverRequest(
                  requestDrivers: snapshot.data,
                ),
                ActiveDriverRequest(requestDrivers: snapshot.data),
                ActiveDriverRequest(
                  requestDrivers: snapshot.data,
                )
              ])
                  : const Center(child: Text("Empty"),);
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
            : StreamBuilder<List<RequestModel>>(
          stream: context.read<RequestDriverRepo>().getDriverRequest(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RequestModel>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? TabBarView(children: <Widget>[
                ActiveRequestView(
                  requestClients: snapshot.data,
                ),
                CompletedRequestView(requestClients: snapshot.data),
                CancelledRequestView(
                  requestClients: snapshot.data,
                )
              ])
                  : const Center(child: Text("Empty"),);
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
