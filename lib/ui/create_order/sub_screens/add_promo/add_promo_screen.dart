import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/promos_image_dots.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({super.key});

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  bool selected = true;

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
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            5,
            (index) => Container(
              margin: EdgeInsets.only(bottom: 24.w),
              padding: EdgeInsets.all(16.w),
              child: ListTile(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                trailing: IconButton(
                    onPressed: null,
                    icon: selected
                        ? SvgPicture.asset(AppIcons.circleTwo)
                        : SvgPicture.asset(AppIcons.circle)),
                leading: DotsGroup(
                  imagePath: AppIcons.getSvg(
                    name: AppIcons.ticketStar,
                    iconType: IconType.bold,
                  ),
                  color: AppColors.gradientGreen,
                ),
                title: Text(
                  "Discount 35% Off",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text("Special promo only today!",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          )
        ],
      ),
    );
  }
}
