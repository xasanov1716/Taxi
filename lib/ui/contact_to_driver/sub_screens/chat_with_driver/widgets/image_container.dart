import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ...List.generate(
          images.length,
          (index) {
            return ClipRRect(
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
            );
          },
        ),
      ],
    );
  }
}
