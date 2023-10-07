import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  CodeInputFieldState createState() => CodeInputFieldState();
}

class CodeInputFieldState extends State<CodeInputField> {
  late CodeInputCubit codeInputCubit;

  @override
  void initState() {
    super.initState();
    codeInputCubit = CodeInputCubit();
    codeInputCubit
      ..setContext(context)
      ..startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Code has been sent to +1 111 ******99",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        60.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 80.0.w,
              child: TextField(
                style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(fontSize: 22.sp),
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(codeInputCubit.pinFocusNodes[index]);
                  });
                },
                controller: codeInputCubit.pinControllers[index],
                maxLength: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only numeric input
                ],
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 32.0.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: getTheme(context) ? AppColors.c_500 : AppColors.c_300),
                  ),
                  filled: true,
                  fillColor: getTheme(context)
                      ? codeInputCubit.pinFocusNodes[index].hasFocus
                          ? AppColors.yellowTransparent
                          : AppColors.dark3
                      : codeInputCubit.pinFocusNodes[index].hasFocus
                          ? AppColors.yellowTransparent
                          : AppColors.c_200,
                ),
                textAlign: TextAlign.center,
                focusNode: codeInputCubit.pinFocusNodes[index],
                onChanged: (value) {
                  setState(() {
                    codeInputCubit.handleCodeInput(index, value);
                  });
                },
              ),
            );
          }),
        ),
        60.ph,
        BlocBuilder<CodeInputCubit, CodeInputState>(
          builder: (context, state) {
            final defaultTextStyle = Theme.of(context).textTheme.titleMedium;

            if (state is CodeInputCountdown) {
              final remainingTime = "${state.remainingTime}";
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend code in ",
                      style: defaultTextStyle,
                    ),
                    TextSpan(
                      text: remainingTime,
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " s",
                      style: defaultTextStyle,
                    ),
                  ],
                ),
              );
            } else {
              return Text(
                "Resend code in 60 s",
                style: defaultTextStyle,
              );
            }
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    codeInputCubit.disposeControllersAndFocusNodes();
    super.dispose();
  }
}
