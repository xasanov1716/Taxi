import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({super.key});

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        centerTitle: false,
        title: "Add Promo",
        onTap: () {},
        action: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search,
                color: getTheme(context) ? AppColors.white : AppColors.c_900,
              )),
        ],
      ),
    );
  }
}
