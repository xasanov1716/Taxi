import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 250.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
        return Wrap(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Container(
                margin: EdgeInsets.all(5.r),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
                height: 120.w,
                width: 120.w,
                child: Image.file(
                  File(images[index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        );
      },),
    );



  }
}
