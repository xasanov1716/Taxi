import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems({
    super.key,
    required this.title,
    required this.img,
  });

  final String title;

  final String img;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(height: height*130/926),
        Image.asset(
          img,
          height: height*260 /926,
          width: width *330 /428 ,
        ),
        SizedBox(height: height / 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width / 13,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
