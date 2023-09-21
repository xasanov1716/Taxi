import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/booking/fake_booking_repository.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/active_now_view/active_now_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/cancelled_view/cancelled_view.dart';
import 'package:taxi_app/ui/tab_box/bookings/views/completed_view/completed_view.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import '../../../utils/icons/app_icons.dart';

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
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Image.asset(
              AppIcons.taxiLogotip,
              width: 32.w,
              height: 32.w,
            ),
          ),
          title: const Text("My bookings"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.getSvg(
                name: AppIcons.search,
                iconType: IconType.lightOutline,
              )),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.getSvg(
                name: AppIcons.moreCircle,
                iconType: IconType.lightOutline,
              )),
            ),
            24.pw,
          ],
          bottom: const TabBar(
            indicator: null,
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: "Active Now"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ActiveNowView(
            orders:[fakeBookings[0]],
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
