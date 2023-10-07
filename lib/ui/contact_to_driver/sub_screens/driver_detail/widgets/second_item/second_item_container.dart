import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/second_item/second_item_in_drivers_detail.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SecondItemContainer extends StatelessWidget {
  const SecondItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          24 * width / figmaWidth,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SeconditemDriversDetail(
                    icon: AppIcons.star, textEnd: tr('ratings'), textMiddle: "4.8"),
                32.pw,
                 SeconditemDriversDetail(
                    icon: AppIcons.taxi,
                    isIconAdditional: true,
                    textEnd: tr('trips'),
                    textMiddle: "279"),
                32.pw,
                SeconditemDriversDetail(
                    icon: AppIcons.timeCircle,
                    textEnd:tr('years'),
                    textMiddle: "5"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
