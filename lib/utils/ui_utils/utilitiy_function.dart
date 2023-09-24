import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';

import '../colors/app_colors.dart';
import '../size/screen_size.dart';
import '../theme/get_theme.dart';

void showBottomSheetDialog(
    BuildContext context, ImagePicker picker, String image) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(24.w),
        height: 250 * height / figmaHeight,
        decoration: BoxDecoration(
          color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  onTap: () {
                    _getFromCamera(context, picker, image);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                  ),
                  title: const Text(
                    "Select from Camera",
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 2)),
                child: ListTile(
                  onTap: () {
                    _getFromGallery(context, picker, image);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColors.white,
                  ),
                  title: const Text(
                    "Select from Gallery",
                    style: TextStyle(color: AppColors.white, fontSize: 20),
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

Future<void> _getFromCamera(
    BuildContext context, ImagePicker picker, String image) async {
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
    image = xFile.path;
  }
}

Future<void> _getFromGallery(
    BuildContext context, ImagePicker picker, String image) async {
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
    image = xFile.path;
  }
}

IconButton getIcon(
  String iconName, {
  required BuildContext context,
  required VoidCallback? onTap,
}) =>
    IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        iconName,
        width: 24.w,
        colorFilter: ColorFilter.mode(
            getTheme(context) ? AppColors.white : AppColors.c_900,
            BlendMode.srcIn),
      ),
    );
