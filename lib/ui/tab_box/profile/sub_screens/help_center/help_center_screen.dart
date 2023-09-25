import 'package:flutter/material.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/contact_us_screen.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/help_center/f_a_q.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utilitiy_function.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor:getTheme(context)?AppColors.dark1: AppColors.c_100,
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            indicator: null,
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            tabs: <Widget>[
              Tab(text: "FAQ"),
              Tab(text: "Contact us"),
            ],
          ),
          leading: getIcon(
            AppIcons.arrowLeft,
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Help Center',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [

            getIcon(
              AppIcons.moreCircle,
              context: context,
              onTap: () {},
            ),
            12.pw,
          ],
        ),
        body:const TabBarView(
          children: <Widget>[
            FaQScreen(),
           ContactUsScreen(),
          ],
        ),
      ),
    );
  }
}
