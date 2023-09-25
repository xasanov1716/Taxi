import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/icons_container/icons_container_screen.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

Widget drBottomNavbar(
  BuildContext context, {
  required VoidCallback onTapBottomChat,
  required VoidCallback onBottomTapCall,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
      color: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
    ),
    child: Padding(
      padding: EdgeInsets.all(
        24 * height / figmaHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconsContainer(
            icon: AppIcons.getSvg(name: AppIcons.chat, iconType: IconType.bold),
            onTap: onTapBottomChat,
          ),
          24.pw,
          IconsContainer(
            icon: AppIcons.getSvg(name: AppIcons.call, iconType: IconType.bold),
            onTap: onBottomTapCall,
          ),
        ],
      ),
    ),
  );
}
