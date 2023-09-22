import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (images.length == 1 ? 130.h : 135 * (images.length / 2)).h,
      width: (images.length == 1 ? 125 : 250).w,
      child: GridView.count(
        crossAxisCount: images.length == 1 ? 1 : 2,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.w,
        childAspectRatio: 1.3,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ...List.generate(
            images.length,
            (index) {
              return GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Container(
                    margin: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r)),
                    height: 120.w,
                    width: 120.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                body: PhotoView(
                                  imageProvider: FileImage(File(images[index])),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Image.file(
                        File(images[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
