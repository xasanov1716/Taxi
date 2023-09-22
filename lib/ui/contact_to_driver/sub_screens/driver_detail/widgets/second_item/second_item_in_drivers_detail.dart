import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/contact_to_driver/sub_screens/driver_detail/widgets/icons_container/icons_container_screen.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class SeconditemDriversDetail extends StatelessWidget {
  const SeconditemDriversDetail(
      {super.key,
      required this.icon,
      required this.textMiddle,
      required this.textEnd, this.isIconAdditional});

  final String icon;
  final String textMiddle;
  final String textEnd;
  final bool? isIconAdditional;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconsContainer(
          icon: isIconAdditional!= null
              ? icon
              : AppIcons.getSvg(name: icon, iconType: IconType.lightOutline),
          onTap: () {},
        ),
        12.pw,
        Text(textMiddle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                )),
        Text(textEnd,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                )),
      ],
    );
  }
}
