import 'package:flutter/material.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/booking/fake_booking_repository.dart';
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
        body: StorageRepository.getString(StorageKeys.userRole) != "client" ?
        TabBarView(children: <Widget>[
          ActiveDriverRequest(
            requestDrivers: [driversRequest[0]],
          ),
          ActiveDriverRequest(requestDrivers: [
            driversRequest[1],
            driversRequest[2],
          ]),
          ActiveDriverRequest(
            requestDrivers: [
              driversRequest[3],
              driversRequest[4],
            ],
          )
        ]) :
        TabBarView(children: <Widget>[
          ActiveRequestView(
            requestClients: [clientsRequest[0]],
          ),
          CompletedRequestView(requestClients: [
            clientsRequest[1],
            clientsRequest[2],
          ]),
          CancelledRequestView(
            requestClients: [
              clientsRequest[3],
              clientsRequest[4],
            ],
          )
        ]),
      ),
    );
  }
}
