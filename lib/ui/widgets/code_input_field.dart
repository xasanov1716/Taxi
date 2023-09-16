import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/code_input_cubit/code_input_cubit.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  _CodeInputFieldState createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  late CodeInputCubit codeInputCubit;

  @override
  void initState() {
    super.initState();
    codeInputCubit = CodeInputCubit();
    codeInputCubit.setContext(context);
    codeInputCubit.startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Code has been sent to +1 111 ******99",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 60.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 75.0.w,
              child: TextField(
                onTap: () {
                  setState(() {
                    FocusScope.of(context)
                        .requestFocus(codeInputCubit.pinFocusNodes[index]);
                  });
                },
                controller: codeInputCubit.pinControllers[index],
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: '',
                  hintStyle: const TextStyle(fontSize: 20.0),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0.h, horizontal: 32.0.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.c_300),
                  ),
                  filled: true,
                  fillColor: codeInputCubit.pinFocusNodes[index].hasFocus
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
        SizedBox(
          height: 60.h,
        ),
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
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
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
