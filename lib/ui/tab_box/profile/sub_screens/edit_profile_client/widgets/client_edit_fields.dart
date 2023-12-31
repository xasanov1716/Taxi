import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/widgets/user_photo.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_dialog.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/ui/widgets/phone_number_text_field.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ClientEditFields extends StatefulWidget {
  const ClientEditFields({super.key, required this.isFromAuth});
  final bool isFromAuth;

  @override
  State<ClientEditFields> createState() => _ClientEditFieldsState();
}

class _ClientEditFieldsState extends State<ClientEditFields> {

  @override
  void initState() {
    initStateToText();
    super.initState();
  }


  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  String gender = tr("male");
  ImagePicker picker = ImagePicker();
  String image = "";

  var phoneFormatter =
      MaskTextInputFormatter(mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  var genders = [tr("male"), tr("female")];

  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode nicknameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode aboutFocusNode = FocusNode();
  final FocusNode telegramFocusNode = FocusNode();
  initStateToText() {
    UsersState state = context.read<UserBloc>().state;

    dateController.text = state.userModel.birthDate;
    fullNameController.text = state.userModel.fullName;
    nicknameController.text = state.userModel.nickName;
    addressController.text = state.userModel.addressText;
    phoneController.text = state.userModel.phone;
    gender = state.userModel.gender;
  }
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      physics: const BouncingScrollPhysics(),
      children: [
        UserPhoto(
          onTap: () {
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
          hintText: tr('full_name'),
          controller: fullNameController,
          onChanged: (value) async {
            context.read<UserBloc>().add(
              UpdateCurrentUserEvent(
                fieldKey: UserFieldKeys.phone,
                value: BlocProvider.of<AuthCubit>(context).state.phoneNumber,
              ),
            );
            context
                .read<UserBloc>()
                .add(UpdateCurrentUserEvent(fieldKey: UserFieldKeys.fullName, value: value));
            context.read<UserBloc>().add(
                  UpdateCurrentUserEvent(
                      fieldKey: UserFieldKeys.fcmToken,
                      value: await FirebaseMessaging.instance.getToken()),
                );
          },
        ),
        24.ph,
        GlobalTextField(
          focusNode: nicknameFocusNode,
          hintText: tr('nickname'),
          controller: nicknameController,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<UserBloc>().add(UpdateCurrentUserEvent(
                fieldKey: UserFieldKeys.nickName, value: value));
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
              hintText: tr('date_of_birth'),
              focusNode: focusNode,
              onTap: () {
                _showDatePicker(context);
              },
              rightImage: AppIcons.calendar,
              controller: dateController,
              onChanged: (value) {
                context.read<UserBloc>().add(UpdateCurrentUserEvent(
                    fieldKey: UserFieldKeys.birthDate, value: value));
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
        if(!widget.isFromAuth) 24.ph,
        Visibility(
          visible: !widget.isFromAuth,
          child: PhoneNumberInput(
            hintText:tr('phone_number'),
            keyboardType: TextInputType.phone,
            focusNode: phoneFocusNode,
            maskFormatter: phoneFormatter,
            controller: phoneController,
            onChanged: (value) {
              context.read<UserBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.phone, value: value.replaceAll(" ", "")));
              if (value.length == 12) {
                context.read<UserBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.emailAddress, value: '${value.replaceAll(" ", "")}@gmail.com'));
                phoneFocusNode.unfocus();
              }
            },
            textInputAction: TextInputAction.next,
          ),
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
              context.read<UserBloc>().add(UpdateCurrentUserEvent(
                  fieldKey: UserFieldKeys.gender, value: newValue));
            },
            hint: Text(gender,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color:
                        getTheme(context) ? AppColors.white : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        GlobalTextField(
          focusNode: aboutFocusNode,
          hintText: tr('address'),
          controller: addressController,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read<UserBloc>()
                .add(UpdateCurrentUserEvent(fieldKey: UserFieldKeys.addressText, value: value));
          },
        ),
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
            initialDateTime: DateTime(2000),
            minimumDate: DateTime(1950),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              if (newDate != selectedDate) {
                setState(() {
                  dateController.text = newDate.toLocal().toString().split(' ')[0];
                  selectedDate = newDate;

                  context.read<UserBloc>().add(UpdateCurrentUserEvent(
                      fieldKey: UserFieldKeys.birthDate, value: dateController.text));
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
