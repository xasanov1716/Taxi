import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/auth/widgets/auth_navigator_button.dart';
import 'package:taxi_app/ui/auth/widgets/auth_text_field.dart';
import 'package:taxi_app/ui/auth/widgets/custom_auth_divider.dart';
import 'package:taxi_app/ui/auth/widgets/social_auth_buttons.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';
import '../widgets/remember_me.dart';

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
          title: ""),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: 48.h, left: 24.w, right: 24.w, top: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Ro`yxatdan o`ting',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  60.ph,
                  Column(
                    children: [
                      AuthTextField(
                        focusNode: phoneFocus,
                        hintText: 'Telefon Raqami',
                        prefixIcon: AppIcons.call,
                        onChanged: (v) {
                          if (v.length == 12) {
                            phoneFocus.unfocus();
                            context
                                .read<AuthCubit>()
                                .updatePhone(v.replaceAll(" ", ""));
                            FocusScope.of(context).requestFocus(passwordFocus);
                          }
                        },
                      ),
                      20.ph,
                      AuthTextField(
                        focusNode: passwordFocus,
                        hintText: 'Parol',
                        prefixIcon: AppIcons.lock,
                        isPassword: true,
                        onChanged: (v) {
                          context
                              .read<AuthCubit>()
                              .updatePassword(v.replaceAll(" ", ""));
                        },
                      ),
                      20.ph,
                      RememberCheckBox(
                        label: 'Meni eslab qol',
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = value;
                          setState(() {});
                        },
                        // label: 'Remember me',
                      ),
                      20.ph,
                      GlobalButton(
                        color: AppColors.primary,
                        title: 'Ro\'yxatdan o\'tish',
                        radius: 100,
                        textColor: AppColors.dark3,
                        onTap: () {
                          String canAuthText =
                              context.read<AuthCubit>().canAuthenticate();
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
                  60.ph,
                  Column(
                    children: [
                      const CustomAuthDividerWidget(label: 'yoki davom eting'),
                      20.ph,
                      const SocialAuthButtons(),
                    ],
                  ),
                  60.ph,
                  AuthNavigatorButton(
                    title: "Hisobingiz bormi?",
                    onTapTitle: "Kirish",
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
                StorageKeys.userId, FirebaseAuth.instance.currentUser!.uid);
            if (context.mounted) {
              showRoleDialog();
            }
          }
        },
      ),
    );
  }

  void showRoleDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: getTheme(context) ? ThemeData.dark() : ThemeData.light(),
          child: CupertinoAlertDialog(
            content: Text(
              "Haydovchi yoki Yo'lovchimisiz?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            title: Image.asset(AppIcons.taxiLogotip),
            actions: [
              TextButton(
                onPressed: () {
                  StorageRepository.putInt(StorageKeys.userRole, 1);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.editProfileDriver,
                    arguments: true,
                    (route) => false,
                  );
                },
                child: Text(
                  "Haydovchi",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  StorageRepository.putInt(StorageKeys.userRole, 0);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.editProfileClient,
                    arguments: true,
                    (route) => false,
                  );
                },
                child: Text(
                  "Yo'lovchi",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
