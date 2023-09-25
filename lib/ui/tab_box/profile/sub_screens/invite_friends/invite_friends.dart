import 'package:flutter/material.dart';
import 'package:google_sign_in/testing.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/invite_friends/widgets/list_view_item_invite.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  List<FakeUser> users= [
    const FakeUser(displayName: "Tynisha Obey\n",email:"+1-300-555-0135",photoUrl: AppIcons.drFake1),
    const FakeUser(displayName: "Florencio Dorrance\n",email:"+1-202-555-0136",photoUrl: AppIcons.drFake2),
    const FakeUser(displayName: "Chantal Shelburne\n",email:"+1-300-555-0119",photoUrl: AppIcons.drFake3),
    const FakeUser(displayName: "Maryland Winkles\n",email:"+1-300-555-0161",photoUrl: AppIcons.drFake4),
    const FakeUser(displayName: "Rodolfo Goode\n",email:"+1-300-555-0136",photoUrl: AppIcons.drFake5),
    const FakeUser(displayName: "Benny Spanbauer\n",email:"+1-202-555-0167",photoUrl: AppIcons.drFake1),
    const FakeUser(displayName: "Tyra Dhillon\n",email:"+1-202-555-0119",photoUrl: AppIcons.drFake2),
    const FakeUser(displayName: "Jamel Eusebio\n",email:"+1-300-555-0171",photoUrl: AppIcons.drFake3),
    const FakeUser(displayName: "Pedro Huard\n",email:"+1-202-555-0171",photoUrl: AppIcons.drFake4),
    const FakeUser(displayName: "Clinton Mcclure\n",email:"+1-300-555-0135",photoUrl: AppIcons.drFake5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const EditAppBar(title: "Invite Friends"),
      body: ListView(
        physics:const BouncingScrollPhysics(),
        children: [
          12.ph,
          ...List.generate(users.length, (index) {
            FakeUser user=users[index];
           return InviteListViewItem(name: user.displayName!, phone: user.email!, image: user.photoUrl!);
          })
        ],
      ),
    );
  }
}
