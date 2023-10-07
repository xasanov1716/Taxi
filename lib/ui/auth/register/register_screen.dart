import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/register/ask_role_dialog.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: tr("sign_up"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w, top: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    tr("create_your_account"),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  60.ph,
                  Column(
                    children: [
                      AuthTextField(
                        focusNode: phoneFocus,
                        hintText: tr('phone_number'),
                        prefixIcon: AppIcons.call,
                        onChanged: (v) {
                          if (v.length == 12) {
                            phoneFocus.unfocus();
                            context.read<AuthCubit>().updatePhone(v.replaceAll(" ", ""));
                            FocusScope.of(context).requestFocus(passwordFocus);
                          }
                        },
                      ),
                      20.ph,
                      AuthTextField(
                        focusNode: passwordFocus,
                        hintText: tr('password'),
                        parolkoz: ' ',
                        prefixIcon: AppIcons.lock,
                        isPassword: true,
                        onChanged: (v) {
                          context.read<AuthCubit>().updatePassword(v.replaceAll(" ", ""));
                        },
                      ),
                      // 20.ph,
                      // RememberCheckBox(
                      //   label: tr('remember_me'),
                      //   value: isChecked,
                      //   onChanged: (value) {
                      //     isChecked = value;
                      //     setState(() {});
                      //   },
                      //   // label: 'Remember me',
                      // ),
                      20.ph,
                      GlobalButton(
                        title: tr('sign_up'),
                        radius: 100,
                        onTap: () {
                          String canAuthText = context.read<AuthCubit>().canAuthenticate();
                          if (canAuthText.isEmpty) {
                            context.read<AuthCubit>().signUp(context);
                          } else {
                            showErrorMessage(
                              message: canAuthText,
                              context: context,
                            );
                          }
                        },
                      )
                    ],
                  ),
                  // 60.ph,
                  // Column(
                  //   children: [
                  //     const CustomAuthDividerWidget(label: tr('or_continue_with')),
                  //     20.ph,
                  //     const SocialAuthButtons(),
                  //   ],
                  // ),
                  60.ph,
                  AuthNavigatorButton(
                    title: "${tr("already_have_an_account")}?",
                    onTapTitle: tr('sign_in'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RouteNames.login);
                    },
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) async {
          if (state.status == FormStatus.authenticated) {
            await StorageRepository.putString(
              StorageKeys.userId,
              FirebaseAuth.instance.currentUser?.uid ?? "",
            );
            if (context.mounted) {
              showRoleDialog(context);
            }
          } else if (state.status == FormStatus.failure) {
            showErrorMessage(message: state.statusMessage, context: context);
          }
        },
      ),
    );
  }
}
