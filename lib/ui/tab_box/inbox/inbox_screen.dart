import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/inbox/widgets/inbox_call_screen.dart';
import 'package:taxi_app/ui/tab_box/inbox/widgets/inbox_chats_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            indicator: null,
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            tabs: <Widget>[
              Tab(text: "Chats"),
              Tab(text: "Calls"),
            ],
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Image.asset(
              AppIcons.taxiLogotip,
              height: 32.h,
            ),
          ),
          title: Text(
            'Inbox',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            getIcon(
              AppIcons.search,
              context: context,
              onTap: () {},
            ),
            getIcon(
              AppIcons.moreCircle,
              context: context,
              onTap: () {},
            ),
            12.pw,
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            InboxChatScreen(
              onTapChat: () {
                Navigator.pushNamed(context, RouteNames.chatWithDriver);
              },
            ),
            InboxCallScreen(
              onTapCall: () {},
            )
          ],
        ),
      ),
    );
  }
}
