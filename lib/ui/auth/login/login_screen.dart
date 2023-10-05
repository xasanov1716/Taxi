import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/login/widgets/forgot_password_button.dart';
import 'package:taxi_app/ui/auth/widgets/social_auth_buttons.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/remember_me.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

import '../../../utils/colors/app_colors.dart';
import '../../widgets/global_button.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Login saxifasi",
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  45.ph,
                  Text(
                    "Xush kelibsiz! Akkauntga kirish",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: width > 450 ? 48.sp : 30.sp,
                        ),
                  ),
                  45.ph,
                  AuthTextField(
                    focusNode: phoneFocus,
                    hintText: 'Telefon Raqami',
                    prefixIcon: AppIcons.call,
                    onChanged: (v) {
                      if (v.length == 12) {
                        phoneFocus.unfocus();
                        context
                            .read<AuthCubit>()
                            .updatePhone(v.replaceAll(' ', ''));
                        FocusScope.of(context).requestFocus(passwordFocus);
                      }
                    },
                  ),
                  20.ph,
                  AuthTextField(
                    focusNode: passwordFocus,
                    hintText: 'Parol',
                    parolkoz: ' ',
                    prefixIcon: AppIcons.lock,
                    isPassword: true,
                    onChanged: (v) {
                      context
                          .read<AuthCubit>()
                          .updatePassword(v.replaceAll(" ", ""));
                    },
                  ),
                  // 24.ph,
                  // RememberCheckBox(
                  //     label: "Meni eslab qol",
                  //     value: isChecked,
                  //     onChanged: (v) {
                  //       setState(() {
                  //         isChecked = v;
                  //       });
                  //     }),
                  24.ph,
                  const Spacer(),
                  GlobalButton(
                      color: AppColors.primary,
                      radius: 100.r,
                      textColor: AppColors.dark3,
                      title: "Kirish",
                      onTap: () async {
                        if (context.mounted) {
                          String canAuthText =
                              context.read<AuthCubit>().canAuthenticate();
                          if (canAuthText.isEmpty) {
                            context.read<AuthCubit>().logIn(context);
                          } else {
                            showErrorMessage(
                              message: canAuthText,
                              context: context,
                            );
                          }
                        }
                      }),
                  // 24.ph,
                  //  const ForgotPasswordButton(),
                  // 45.ph,
                  // Column(
                  //   children: [
                  //     const CustomAuthDividerWidget(
                  //         label: "yoki davom eting"),
                  //     20.ph,
                  //     const SocialAuthButtons(),
                  //   ],
                  // ),
                  //  25.ph,

                  AuthNavigatorButton(
                    title: "Akkauntingiz yo'qmi?",
                    onTapTitle: "Ro'yxatdan o'ting",
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.signUp);
                    },
                  )
                ],
              ),
            );
          },
          listener: (context, state) async {
            if (state.status == FormStatus.authenticated) {
              await StorageRepository.putString(
                StorageKeys.userId,
                FirebaseAuth.instance.currentUser!.uid,
              );
              if (context.mounted) {
                await context.read<DriverBloc>().getDriverByDocId();
                if (context.mounted) {
                  await context.read<UserBloc>().getUserByDocId();
                }

                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.tabBox, (route) => false);
                }
              }
              if (state.status == FormStatus.failure && context.mounted) {
                showErrorMessage(
                    message: state.statusMessage, context: context);
              }
            }
          },
        ));
  }
}
