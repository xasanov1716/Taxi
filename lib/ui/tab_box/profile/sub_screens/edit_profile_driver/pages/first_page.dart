import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_dialog.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/ui/widgets/phone_number_text_field.dart';
import 'package:taxi_app/ui/widgets/user_image.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  String gender = "Male";
  ImagePicker picker = ImagePicker();
  String image = "";

  var phoneFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var genders = ['Male', 'Female'];

  String selectItem = '';
  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode nicknameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode aboutFocusNode = FocusNode();
  final FocusNode telegramFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: 1,color: AppColors.dark2)
              ),
            ),
            20.pw,
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: 1,color: AppColors.dark2)
              ),
            ),
            20.pw,
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: 1,color: AppColors.dark2)
              ),
            ),
          ],
        ),
        24.ph,
        UserImage(
          onTap: () {
            // showBottomSheetDialog(
            //   context,
            //   picker
            // );
            profileDialog(
                picker: picker,
                context: context,
                valueChanged: (v) {
                  setState(() {
                    image = v;
                  });
                });
          },
        ),
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: getTheme(context)
                ? AppColors.dark2
                : AppColors.greysCale, // Use the desired background color
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor:
                getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
            icon: SvgPicture.asset(
              AppIcons.getSvg(
                  name: AppIcons.arrowDown2, iconType: IconType.bold),
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn),
            ),
            borderRadius: BorderRadius.circular(12.r),
            items: genders.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                gender = newValue!;
              });
              context.read<UserCubit>().updateCurrentUserField(
                  fieldKey: UserFieldKeys.gender, value: newValue);
            },
            hint: Text(gender,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        GlobalTextField(
          focusNode: aboutFocusNode,
          hintText: 'About Driver',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<UserCubit>().updateCurrentUserField(
                fieldKey: UserFieldKeys.fullName, value: value);
          },
        ),
        24.ph,
        GlobalTextField(
          focusNode: telegramFocusNode,
          hintText: 'Telegram link',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<UserCubit>().updateCurrentUserField(
                fieldKey: UserFieldKeys.fullName, value: value);
          },
        ),
        24.ph
      ],
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
                      fieldKey: UserFieldKeys.birthDate,
                      value: dateController.text);
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
}