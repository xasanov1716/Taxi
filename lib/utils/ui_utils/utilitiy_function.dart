import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_app/cubits/address_cubit/address_cubit.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

import '../colors/app_colors.dart';
import '../size/screen_size.dart';
import '../theme/get_theme.dart';

void showBottomSheetDialog(
  BuildContext context,
  ImagePicker picker,
) {
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
                    _getFromCamera(context, picker);
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
                    _getFromGallery(context, picker);
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
  BuildContext context,
  ImagePicker picker,
) async {
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
  }
}

Future<void> _getFromGallery(
  BuildContext context,
  ImagePicker picker,
) async {
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
  }
}

IconButton getIcon(
  String iconName, {
  required BuildContext context,
  required VoidCallback? onTap,
  Color? color,
  IconType? iconType,
}) =>
    IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        AppIcons.getSvg(
          name: iconName,
          iconType: iconType ?? IconType.lightOutline,
        ),
        width: 24.w,
        colorFilter: ColorFilter.mode(
            color ?? (getTheme(context) ? AppColors.white : AppColors.c_900),
            BlendMode.srcIn),
      ),
    );

void addAddressDialog(
    BuildContext context,
    TextEditingController apartmentController,
    TextEditingController orientationController,
    CameraPosition currentCameraPosition,
    VoidCallback onTap) {
  showModalBottomSheet(
    backgroundColor: getTheme(context) ? AppColors.dark1 : AppColors.c_100,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40.r), right: Radius.circular(40.r))),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Text(
                  'Address Details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700),
                )),
                24.ph,
                const Divider(
                  color: AppColors.c_200,
                ),
                24.ph,
                BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                  if (state is AddressSuccessState) {
                    return Text(
                      state.address,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    );
                  }
                  return Text(
                    'Name Address',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 18),
                  );
                }),
                16.ph,
                GlobalTextField(
                  hintText: 'Apartment',
                  controller: apartmentController,
                ),
                24.ph,
                Text(
                  'Address Details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
                16.ph,
                GlobalTextField(
                  controller: orientationController,
                  hintText: '931 Indian Summer Drive Taylor, MI 48180kg',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppIcons.location,
                      colorFilter: ColorFilter.mode(
                          getTheme(context) ? AppColors.white : AppColors.c_900,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                24.ph,
                GlobalButton(
                  title: 'Add Address',
                  onTap: onTap,
                  radius: 100.r,
                  color: AppColors.primary,
                ),
                24.ph
              ],
            ),
          ),
        ),
      );
    },
  );
}
