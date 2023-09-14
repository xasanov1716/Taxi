import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';

class PageIndexItem extends StatelessWidget {
  const PageIndexItem({
    super.key,
    required this.activePageIndex,
  });

  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        activePageIndex == 0
            ? Container(
                height: 8,
                width: 32,
                decoration: BoxDecoration(
                    gradient: AppColors.gradientYellow,
                    borderRadius: BorderRadius.circular(100)),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: AppColors.c_300,
                    borderRadius: BorderRadius.circular(100)),
              ),
        SizedBox(width: width / 80),
        activePageIndex == 1
            ? Container(
                height: 8,
                width: 32,
                decoration: BoxDecoration(
                    gradient: AppColors.gradientYellow,
                    borderRadius: BorderRadius.circular(100)),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: AppColors.c_300,
                    borderRadius: BorderRadius.circular(100)),
              ),
        SizedBox(width: width / 80),
        activePageIndex == 2
            ? Container(
                height: 8,
                width: 32,
                decoration: BoxDecoration(
                    gradient: AppColors.gradientYellow,
                    borderRadius: BorderRadius.circular(100)),
              )
            : Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: AppColors.c_300,
                    borderRadius: BorderRadius.circular(100)),
              ),
      ],
    );
  }
}
