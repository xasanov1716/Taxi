import 'package:flutter/material.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/third_item/third_Item_in_driver_detail.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ThirdItemContainer extends StatelessWidget {
  const ThirdItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          24 * width / figmaWidth,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThirdItemInDriverDetail(
              startText: "Member Since",
              endText: "July 15, 2019",
            ),
            ThirdItemInDriverDetail(
              startText: "Car Model",
              endText: "July 15, 2019",
            ),
            ThirdItemInDriverDetail(
              startText: "Plate Number",
              endText: "HSW 4736 XK",
            ),
          ],
        ),
      ),
    );
    ;
  }
}
