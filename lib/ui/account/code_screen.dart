import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';


class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}




class _CodeScreenState extends State<CodeScreen> {

  TextEditingController codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    FocusNode focusNode = FocusNode();

    const focusedBorderColor = Colors.blue;
    const fillColor = AppColors.c_50;


    final defaultPinTheme = PinTheme(
      height: 61,
      textStyle:  TextStyle(
          fontSize: 24.sp,
          color: AppColors.c_900,
          fontWeight: FontWeight.w700
      ),
      padding:  EdgeInsets.only(left: 32.w,right: 32.w,top: 16.h,bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.c_200,width: 2),
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text("Создать новый PIN-код",style: TextStyle(fontSize: 18),),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 24.w,right: 24.w,bottom: 48.h),
          child: Column(
            children: [
              Expanded(child: ListView(
                children: [
                  const SizedBox(
                    height: 115,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add a PIN number to make your account\n                    more secure.',style: TextStyle(fontSize: 18.sp),),
                    ],
                  ),
                  SizedBox(height: 80.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            length: 4,
                            controller: codeController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) =>  SizedBox(width: 4.w),
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 10.w,
                                  height: 1.h,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              GlobalButton(color: AppColors.primary, title: 'Continue', radius: 100, textColor: AppColors.black, onTap: (){
                if(codeController.text.isNotEmpty){
                  StorageRepository.putString('code', codeController.text);
                }
                Navigator.pushNamed(context, RouteNames.fingerprintScreen);
              }),
            ],
          ),
        ));
  }}