import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/widgets/client_edit_fields.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/ui_utils/show_snackbar.dart';

class EditProfileClientScreen extends StatefulWidget {
  const EditProfileClientScreen({super.key, required this.navigateFromAuth});

  final bool navigateFromAuth;

  @override
  State<EditProfileClientScreen> createState() =>
      _EditProfileClientScreenState();
}

class _EditProfileClientScreenState extends State<EditProfileClientScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAppBar(
          hideBackButton: widget.navigateFromAuth,
          title: widget.navigateFromAuth ? tr("create_profile") : tr("edit_profile")),
      body: BlocConsumer<UserBloc, UsersState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Expanded(
                  child: ClientEditFields(
                    isFromAuth: widget.navigateFromAuth,
                  ),
                ),
                GlobalButton(
                  title: widget.navigateFromAuth ? tr("create_user") : tr("update"),
                  onTap: () {
                    if (widget.navigateFromAuth) {
                      context.read<UserBloc>().add(UpdateCurrentUserEvent(
                          fieldKey: UserFieldKeys.createdAt,
                          value: DateTime.now().toString()));

                      context.read<UserBloc>().add(UpdateCurrentUserEvent(
                          fieldKey: UserFieldKeys.userId,
                          value: StorageRepository.getString(
                            StorageKeys.userId,
                          )));
                      context.read<UserBloc>().add(UpdateCurrentUserEvent(
                            fieldKey: UserFieldKeys.phone,
                            value: BlocProvider.of<AuthCubit>(context)
                                .state
                                .phoneNumber,
                          ));
                      context.read<UserBloc>().add(UpdateCurrentUserEvent(
                            fieldKey: UserFieldKeys.password,
                            value: BlocProvider.of<AuthCubit>(context)
                                .state
                                .password,
                          ));
                      if (context.read<UserBloc>().canRequest().isEmpty) {
                        context.read<UserBloc>().add(AddUserEvent());
                      } else {
                        showSnackBar(
                            context: context,
                            text:
                                '${context.read<UserBloc>().canRequest()} is required');
                      }
                    } else {
                      showSnackBar(
                          context: context,
                          text:
                              '${context.read<UserBloc>().canRequest()} ${tr("is_required")}');
                      context.read<UserBloc>().add(UpdateUserEvent());
                    }
                  },
                  radius: 100.r,
                )
              ],
            ),
          );
        },
        listener: (context, state) {
          debugPrint('listener');
          if (state.status == FormStatus.loading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state.status == FormStatus.success) {
            if (widget.navigateFromAuth) {
              Navigator.pushReplacementNamed(context, RouteNames.tabBox);
            }
          }
          if (state.status == FormStatus.updated) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
