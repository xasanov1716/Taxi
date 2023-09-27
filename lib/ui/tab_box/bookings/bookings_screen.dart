import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/booking/fake_booking_repository.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/active_now_view/active_now_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/cancelled_view/cancelled_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/completed_view/completed_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/widgets/booking_appbar.dart';

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
        body: TabBarView(children: <Widget>[
          ActiveNowView(
            orders: [fakeBookings[0]],
          ),
          CompletedView(orders: [
            fakeBookings[1],
            fakeBookings[2],
          ]),
          CancelledView(
            orders: [
              fakeBookings[3],
              fakeBookings[4],
            ],
          )
        ]),
      ),
    );
  }
}
