 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

AppBar inbox_appbar(BuildContext context) {
    return AppBar(
        bottom: const TabBar(
          indicator: null,
          tabAlignment: TabAlignment.fill,
          isScrollable: false,
          tabs: <Widget>[
            Tab(text: "Chats"),
            Tab(text: "Calls"),
          ],
        ),
        leading: SvgPicture.asset(
          AppIcons.taxiLogo,
          width: 32.w,
        ),
        title: Text(
          'Inbox',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.search, width: 32.w)),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.moreCircle, width: 32.w))
        ],
      );
  }
