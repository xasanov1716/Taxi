import 'package:easy_localization/easy_localization.dart';
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
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';

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
          title: tr("login_page"),
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
                    tr("login_to_your_account"),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: width > 450 ? 48.sp : 30.sp,
                        ),
                  ),
                  45.ph,
                  AuthTextField(
                    focusNode: phoneFocus,
                    hintText: tr("phone_number"),
                    prefixIcon: AppIcons.call,
                    onChanged: (v) {
                      if (v.length == 12) {
                        phoneFocus.unfocus();
                        context.read<AuthCubit>().updatePhone(v.replaceAll(' ', ''));
                        FocusScope.of(context).requestFocus(passwordFocus);
                      }
                    },
                  ),
                  20.ph,
                  AuthTextField(
                    focusNode: passwordFocus,
                    hintText: tr("password"),
                    parolkoz: ' ',
                    prefixIcon: AppIcons.lock,
                    isPassword: true,
                    onChanged: (v) {
                      context.read<AuthCubit>().updatePassword(v.replaceAll(" ", ""));
                    },
                  ),
                  // 24.ph,
                  // RememberCheckBox(
                  //     label: tr("remember_me"),
                  //     value: isChecked,
                  //     onChanged: (v) {
                  //       setState(() {
                  //         isChecked = v;
                  //       });
                  //     }),
                  24.ph,
                  const Spacer(),
                  GlobalButton(
                      radius: 100.r,
                      title: tr("sign_in"),
                      onTap: () async {
                        if (context.mounted) {
                          String canAuthText = context.read<AuthCubit>().canAuthenticate();
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
                  //         label: tr("or_continue_with),
                  //     20.ph,
                  //     const SocialAuthButtons(),
                  //   ],
                  // ),
                  //  25.ph,

                  AuthNavigatorButton(
                    title: "${tr("dont_have_an_account")}?",
                    onTapTitle: tr("create_your_account"),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RouteNames.signUp);
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
                  Navigator.pushNamedAndRemoveUntil(context, RouteNames.tabBox, (route) => false);
                }
              }
              if (state.status == FormStatus.failure && context.mounted) {
                showErrorMessage(message: state.statusMessage, context: context);
              }
            }
          },
        ));
  }
}
