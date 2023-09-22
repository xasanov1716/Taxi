import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class AddressAddDetailScreen extends StatefulWidget {
  const AddressAddDetailScreen({super.key});

  @override
  State<AddressAddDetailScreen> createState() => _AddressAddDetailScreenState();
}

class _AddressAddDetailScreenState extends State<AddressAddDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Add New Address",
        action: [
          SvgPicture.asset(AppIcons.moreCircle),
        ],
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
