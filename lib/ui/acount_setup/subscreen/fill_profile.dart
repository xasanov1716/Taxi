import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_search_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController nickName = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController emil = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController gender = TextEditingController();

  String? selectedGender;
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  var maskFormatter = MaskTextInputFormatter(
      mask: '00/00/0000',
      filter: {"0": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var phoneFormatter = MaskTextInputFormatter(
      mask: '+998 ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final FocusNode focusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Заполните свой профиль'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, bottom: 12.h, top: 12.h),
        child: Column(
          children: [
            Container(
              height: 142,
              width: 175,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.c_50,
              ),
              child: Stack(
                children: [
                  const Center(
                      child: Icon(
                    Icons.person,
                    size: 140,
                    color: AppColors.c_400,
                  )),
                  Positioned(
                    bottom: 0,
                    right: 1.w,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.primary),
                      child: const Icon(
                        Icons.edit,
                        size: 29,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                   SizedBox(height: 24.h),
                  GlobalSearchTextField(
                    hintText: 'Full Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: fullName,
                  ),
                   SizedBox(height: 24.h),
                  GlobalSearchTextField(
                    hintText: 'Nickname',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: nickName,
                  ),
                   SizedBox(height: 24.h),
                  GlobalSearchTextField(
                    maskFormatter: maskFormatter,
                    hintText: 'Date of Birth',
                    focusNode: focusNode,
                    onChanged: (v) {
                      if (v.length == 10) {
                        focusNode.unfocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: date,
                  ),
                   SizedBox(height: 24.h),
                  GlobalSearchTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emil,
                  ),
                   SizedBox(height: 22.h),
                  GlobalSearchTextField(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    focusNode: phoneFocusNode,
                    maskFormatter: phoneFormatter,
                    onChanged: (value) {
                      if (value.length == 16) {
                        phoneFocusNode.unfocus();
                      }
                    },
                    textInputAction: TextInputAction.next,
                    controller: phone,
                  ),
                  SizedBox(height: 24.h),
                  GlobalSearchTextField(
                    hintText: 'Gender',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: gender,
                  ),
                  SizedBox(height: 60.h),
                ],
              ),
            ),
            //  SizedBox(height: 30.h,),
            GlobalButton(
                color: AppColors.amber,
                title: 'Continue',
                radius: 12,
                textColor: AppColors.white,
                onTap: () {
                  if (fullName.text.isNotEmpty &&
                      phone.text.isNotEmpty &&
                      date.text.isNotEmpty &&
                      emil.text.isNotEmpty &&
                      nickName.text.isNotEmpty) {
                    Navigator.pushNamed(context, RouteNames.code);
                  }
                }),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
