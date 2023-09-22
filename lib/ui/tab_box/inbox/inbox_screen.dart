import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/inbox/widgets/inbox_appbar.dart';
import 'package:taxi_app/ui/tab_box/inbox/widgets/inbox_call_screen.dart';
import 'package:taxi_app/ui/tab_box/inbox/widgets/inbox_chats_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: inbox_appbar(context),
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
          floatingActionButton:FloatingActionButton(onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: AppColors.primary,
            child: SvgPicture.asset(AppIcons.add),
          ),
      ),
    );
  }
}
