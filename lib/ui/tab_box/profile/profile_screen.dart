import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart'
    show
        BuildContext,
        Center,
        FontWeight,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    isSwitched = await Future.microtask(() => getTheme(context));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: CupertinoSwitch(
              onChanged: (v) {
                setState(() {
                  isSwitched = !isSwitched;
                });
                if (isSwitched) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
              value: isSwitched,
            ),
          ),
          TextButton(onPressed: (){}, child: const Text("Edit Profile")),
          TextButton(onPressed: (){}, child: const Text("Address")),
          TextButton(onPressed: (){}, child: const Text("Notification")),
          TextButton(onPressed: (){}, child: const Text("Payment")),
          TextButton(onPressed: (){}, child: const Text("Security")),
          TextButton(onPressed: (){}, child: const Text("Language")),
          TextButton(onPressed: (){}, child: const Text("Dark Mode")),
          TextButton(onPressed: (){}, child: const Text("Privacy Policy")),
          TextButton(onPressed: (){}, child: const Text("Help Center")),
          TextButton(onPressed: (){}, child: const Text("Invite Friends")),
          TextButton(onPressed: (){}, child: const Text("Logout")),
        ],
      ),
    );
  }
}

