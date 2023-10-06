import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class BookingAppBar extends StatelessWidget implements PreferredSize {
  const BookingAppBar({
    Key? key,
    this.searchOnTap,
    this.moreOnTap,
    this.title = "",
  }) : super(key: key);

  final VoidCallback? searchOnTap;
  final VoidCallback? moreOnTap;
  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Image.asset(
          AppIcons.taxiLogotip,
          width: 32.w,
          height: 32.w,
        ),
      ),
      title:  Text(title),
      actions: [
        getIcon(AppIcons.search, context: context, onTap: searchOnTap),
        getIcon(AppIcons.moreCircle, context: context, onTap:moreOnTap),
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
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override

  Size get preferredSize => Size(double.infinity,125.h );


}
