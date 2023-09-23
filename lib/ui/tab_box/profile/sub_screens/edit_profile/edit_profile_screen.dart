import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/local_auth/widgets/pop_up.dart';
import 'package:taxi_app/ui/local_auth/widgets/user_image.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/ui/widgets/phone_number_text_field.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController gender = TextEditingController();

  var phoneFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  List<String> genders = ['Male', 'Female'];
  String selectGender = '';

  ImagePicker picker = ImagePicker();

  String selectItem = '';
  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode nicknameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  String image = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Fill Your Profile'),
      body: Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  UserImage(
                      userImage: image.isEmpty
                          ? Image.asset(
                              AppIcons.emptyProfile,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.file(
                                File(image),
                                width: 142 * width / figmaWidth,
                                height: 142 * width / figmaWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                      edit: AppIcons.editSquare,
                      onTap: () {
                        showBottomSheetDialog(context);
                      }),
                  24.ph,
                  GlobalTextField(
                    focusNode: fullNameFocusNode,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.fullName, value: value);
                    },
                  ),
                  24.ph,
                  GlobalTextField(
                    focusNode: nicknameFocusNode,
                    hintText: 'Nickname',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.nickName, value: value);
                    },
                  ),
                  24.ph,
                  GestureDetector(
                    onTap: () {
                      _showDatePicker(context);
                    },
                    child: AbsorbPointer(
                      child: GlobalSearchTextField(
                        readOnly: true,
                        hintText: 'Date of Birth',
                        focusNode: focusNode,
                        onTap: () {
                          _showDatePicker(context);
                        },
                        rightImage: AppIcons.calendar,
                        controller: dateController,
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  24.ph,
                  GlobalTextField(
                    focusNode: emailFocusNode,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.emailAddress, value: value);
                    },
                  ),
                  22.ph,
                  PhoneNumberInput(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    focusNode: phoneFocusNode,
                    maskFormatter: phoneFormatter,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.phone, value: value);
                      if (value.length == 12) {
                        phoneFocusNode.unfocus();
                      }
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  24.ph,
                  GlobalTextField(
                    readOnly: true,
                    hintText: 'Gender',
                    suffixIcon: PopupMenuButton<String>(
                      color: AppColors.white,
                      child: Icon(Icons.keyboard_arrow_down_sharp),
                      initialValue: selectGender,
                      onSelected: (value) {
                        setState(() {
                          selectGender = value;
                        });
                        gender.text = value;
                        context.read<UserCubit>().updateCurrentUserField(
                            fieldKey: UserFieldKeys.gender, value: value);
                      },
                      itemBuilder: (BuildContext context) {
                        return genders.map((String category) {
                          return PopupMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(color: AppColors.c_900),
                            ),
                          );
                        }).toList();
                      },
                    ),
                    controller: gender,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.gender, value: value);
                    },
                  ),
                  24.ph,
                ],
              ),
            ),
            24.ph,
            GlobalButton(
              color: AppColors.disabledButton,
              title: "Continue",
              radius: 100,
              textColor: AppColors.black,
              onTap: () {
                // if (context.read<UserCubit>().canRegister()) {
                //   Navigator.pushNamed(context, RouteNames.setPinCodeScreen);
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       backgroundColor:
                //           getTheme(context) ? AppColors.c_900 : AppColors.c_700,
                //       content: Text(
                //         "Maydonlar to'liq emas",
                //         style: TextStyle(
                //             color: getTheme(context)
                //                 ? AppColors.white
                //                 : AppColors.black),
                //       ),
                //     ),
                //   );
                // }
                Navigator.pushNamed(context, RouteNames.setPinCodeScreen);
              },
            ),
            24.ph
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          height: 300 * height / figmaHeight,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            minimumDate: DateTime(1950),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              if (newDate != selectedDate) {
                setState(() {
                  dateController.text =
                      newDate.toLocal().toString().split(' ')[0];
                  selectedDate = newDate;
                  context.read<UserCubit>().updateCurrentUserField(
                      fieldKey: UserFieldKeys.date, value: dateController.text);
                });
              }
            },
          ),
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    onTap: () {
                      _getFromCamera();
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
                      _getFromGallery();
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

  Future<void> _getFromCamera() async {
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
      setState(() {});
    }
  }

  Future<void> _getFromGallery() async {
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
      setState(() {});
    }
  }
}
