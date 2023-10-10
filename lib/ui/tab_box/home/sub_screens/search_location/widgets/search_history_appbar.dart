import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

class SearchLocationAppBar extends StatelessWidget implements PreferredSize {
  const SearchLocationAppBar({
    Key? key,
    required this.onChanged,
    required this.searchFocusNode,
    required this.hintText,
    required this.filterOnTap,
  }) : super(key: key);

  final ValueChanged onChanged;
  final FocusNode searchFocusNode;
  final VoidCallback filterOnTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: GlobalTextField(
        onChanged: onChanged,
        focusNode: searchFocusNode,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 12.w),
          child: SvgPicture.asset(
            AppIcons.search,
            colorFilter: ColorFilter.mode(
                getTheme(context) ? AppColors.c_600 : AppColors.c_400, BlendMode.srcIn),
          ),
        ),
        hintText: hintText,
        suffixIcon: getIcon(AppIcons.filter, context: context, onTap: filterOnTap),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
