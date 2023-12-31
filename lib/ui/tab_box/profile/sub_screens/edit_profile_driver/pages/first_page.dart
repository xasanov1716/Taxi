import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/car_number_template.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_driver/widgets/car_number_template_2.dart';
import 'package:taxi_app/ui/tab_box/profile/widgets/profile_dialog.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/ui/widgets/phone_number_text_field.dart';
import 'package:taxi_app/ui/widgets/user_image.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.isFromAuth});
  final bool isFromAuth;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController aboutDriverController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController telegramLinkController = TextEditingController();

  initStateToText() {
    DriverState state = context.read<DriverBloc>().state;

    dateController.text = state.driverModel.birthDate;
    fullNameController.text = state.driverModel.fullName;
    phoneNumberController.text = state.driverModel.phoneNumber;
    aboutDriverController.text = state.driverModel.aboutDriver;
    carNumberController.text = state.driverModel.carNumber;
    telegramLinkController.text = state.driverModel.telegramLink;
    gender = state.driverModel.gender;
  }

  @override
  void initState() {
    if (!widget.isFromAuth) initStateToText();
    super.initState();
  }

  String gender =  tr("male");
  ImagePicker picker = ImagePicker();

  var phoneFormatter =
      MaskTextInputFormatter(mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  var carNumber = MaskTextInputFormatter(
      mask: '##*###**', filter: {"#": RegExp(r'[0-9]'), "*": RegExp(r'[A-Z]')});

  var genders = [tr("male"), tr("female")];
  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode nicknameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode aboutFocusNode = FocusNode();
  final FocusNode telegramFocusNode = FocusNode();
  bool isCorp = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        24.ph,
        UserImage(
          onTap: () {
            profileDialog(picker: picker, context: context, valueChanged: (v) {});
          },
        ),
        24.ph,
        GlobalTextField(
          controller: fullNameController,
          focusNode: fullNameFocusNode,
          hintText: tr('full_name'),
          onChanged: (value) async {
            context
                .read<DriverBloc>()
                .updateDriverField(fieldKey: DriverFieldKeys.fullName, value: value);

            context.read<DriverBloc>().updateDriverField(
                fieldKey: DriverFieldKeys.driverId, value: FirebaseAuth.instance.currentUser!.uid);

            context.read<DriverBloc>().updateDriverField(
                fieldKey: DriverFieldKeys.fcmToken,
                value: await FirebaseMessaging.instance.getToken());
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
              onChanged: (value) {},
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ),
        if (!widget.isFromAuth) 24.ph,
        Visibility(
          visible: !widget.isFromAuth,
          child: PhoneNumberInput(
            controller: phoneNumberController,
            hintText: tr('phone_number'),
            keyboardType: TextInputType.phone,
            focusNode: phoneFocusNode,
            maskFormatter: phoneFormatter,
            onChanged: (value) {
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.phoneNumber, value: value.replaceAll(" ", ""));
              if (value.length == 12) {
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
            dropdownColor: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
            icon: SvgPicture.asset(
              AppIcons.getSvg(name: AppIcons.arrowDown2, iconType: IconType.bold),
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900, BlendMode.srcIn),
            ),
            borderRadius: BorderRadius.circular(12.r),
            items: genders.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: AppTextStyle.bodyMediumSemibold
                      .copyWith(color: getTheme(context) ? AppColors.white : AppColors.c_900),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                gender = newValue!;
              });
              context
                  .read<DriverBloc>()
                  .updateDriverField(fieldKey: DriverFieldKeys.gender, value: newValue);
            },
            hint: Text(gender,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color:
                        getTheme(context) ? AppColors.white : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        GlobalTextField(
          controller: aboutDriverController,
          focusNode: aboutFocusNode,
          hintText: tr('about_driver'),
          maxLength: 100,
          maxLines: 5,
          onChanged: (value) {
            context
                .read<DriverBloc>()
                .updateDriverField(fieldKey: DriverFieldKeys.aboutDriver, value: value);
          },
        ),
        24.ph,
        if (widget.isFromAuth)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${tr('legal_entity')}?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CupertinoSwitch(
                  value: isCorp,
                  onChanged: (v) {
                    StorageRepository.putBool(StorageKeys.carNumberType, v);
                    setState(() {
                      isCorp = v;
                    });
                  }),
            ],
          ),
        if (widget.isFromAuth) 10.ph,
        StorageRepository.getBool(StorageKeys.carNumberType)
            ? CarNumberContainer2(
                isFromAuth: widget.isFromAuth,
              )
            : CarNumberContainer(
                isFromAuth: widget.isFromAuth,
              ),
        24.ph,
        GlobalTextField(
          controller: telegramLinkController,
          focusNode: telegramFocusNode,
          hintText: tr('telegram_username'),
          onChanged: (value) {
            context.read<DriverBloc>().updateDriverField(
                fieldKey: DriverFieldKeys.telegramLink, value: "https//:t.me/$value");
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
                  dateController.text = newDate.toLocal().toString().split(' ')[0];
                  selectedDate = newDate;
                  context.read<DriverBloc>().updateDriverField(
                      fieldKey: DriverFieldKeys.birthDate, value: dateController.text);
                  context.read<DriverBloc>().updateDriverField(
                      fieldKey: DriverFieldKeys.email,
                      value: FirebaseAuth.instance.currentUser!.email);
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
