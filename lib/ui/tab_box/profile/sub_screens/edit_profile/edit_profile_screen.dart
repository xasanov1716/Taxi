import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/local_auth/widgets/pop_up.dart';
import 'package:taxi_app/ui/local_auth/widgets/user_image.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/ui/widgets/phone_number_text_field.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime selectedDate = DateTime.now();

  TextEditingController dateController = TextEditingController();
  TextEditingController gender = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
      mask: '00-00-0000',
      filter: {"0": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var phoneFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  int selectedMenu = 1;

  List<String> item = ['Male', 'Female'];

  String selectItem = '';
  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode nickNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(onTap: () {
        Navigator.pop(context);
      }, title: 'Fill Your Profile'),
      body: Padding(
        padding:
        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 12.h, top: 12.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  UserImage(
                      userImage: AppIcons.emptyProfile,
                      edit: AppIcons.editSquare),
                  24.ph,
                  GlobalSearchTextField(
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
                  GlobalSearchTextField(
                    focusNode: nickNameFocusNode,
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
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: GlobalSearchTextField(
                        maskFormatter: maskFormatter,
                        readOnly: true,
                        hintText: 'Date of Birth',
                        focusNode: focusNode,
                        onTap: () {
                          _selectDate(context);
                        },
                        rightImage: AppIcons.calendar,
                        controller: dateController,
                        onChanged: (value) {
                          if (value.length == 10) {
                            focusNode.unfocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,),
                    ),
                  ),
                  24.ph,
                  GlobalSearchTextField(
                    hintText: 'Email',
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context.read<UserCubit>().updateCurrentUserField(
                          fieldKey: UserFieldKeys.emailAddress, value: value);
                    },
                    rightImage: AppIcons.message,
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
                  GlobalSearchTextField(
                    readOnly: true,
                    hintText: 'Gender',
                    onTap: () {
                      PopUp(
                        onMoreTap: (int item) {
                          setState(() {
                            selectedMenu = item;
                          });
                          if (selectedMenu == 1) {
                            gender.text = 'Male';
                          } else {
                            gender.text = 'Female';
                          }
                        },
                      );
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: gender,
                    onChanged: (value) {
                      // context.read<UserCubit>().updateCurrentUserField(fieldKey: UserFieldKeys.fullName, value: value);
                    },
                    rightImage: AppIcons.arrowDown2,
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
                  Navigator.pushNamed(context, RouteNames.codeScreen);
                }),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toString().split(' ')[0];
      });
    }
  }
}
