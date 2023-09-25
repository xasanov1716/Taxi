import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

void profileDialog({required ImagePicker picker, required BuildContext context, required ValueChanged<String> valueChanged}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16.r)),
                child: ListTile(
                  onTap: () {
                    _getFromCamera(picker: picker,context: context,valueChanged: (v){
                      valueChanged(v);
                    });
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                  ),
                  title: Text(
                    "Select from Camera",
                    style: TextStyle(color: AppColors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white, width: 2)),
                child: ListTile(
                  onTap: () {
                    _getFromGallery(picker: picker,context: context,valueChanged: (v){
                      valueChanged(v);
                    });
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColors.white,
                  ),
                  title: Text(
                    "Select from Gallery",
                    style: TextStyle(color: AppColors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<void> _getFromCamera({required ImagePicker picker, required BuildContext context, required ValueChanged<String> valueChanged}) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.camera,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );

  if (xFile != null && context.mounted) {
    context.read<UserCubit>().updateCurrentUserField(
      fieldKey: UserFieldKeys.image,
      value: xFile.path,
    );
    valueChanged(xFile.path);
  }
}

Future<void> _getFromGallery({required ImagePicker picker, required BuildContext context, required ValueChanged<String> valueChanged}) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );
  if (xFile != null && context.mounted) {
    context.read<UserCubit>().updateCurrentUserField(
      fieldKey: UserFieldKeys.image,
      value: xFile.path,
    );
    valueChanged(xFile.path);
  }
}