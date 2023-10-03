import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/widgets/client_edit_fields.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/edit_profile_client/widgets/edit_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
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
          title: widget.navigateFromAuth ? "Create Profile" : "Edit Profile"),
      body: BlocConsumer<UserBloc, UsersState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                const Expanded(
                  child: ClientEditFields(),
                ),
                GlobalButton(
                  title: "Update",
                  onTap: () {
                    context.read<UserBloc>().add(UpdateCurrentUserEvent(
                        fieldKey: UserFieldKeys.createdAt,
                        value: DateTime.now().toString()));

                    context.read<UserBloc>().add(UpdateCurrentUserEvent(
                        fieldKey: UserFieldKeys.userId,
                        value:
                            StorageRepository.getString(StorageKeys.userId)));

                    if (context.read<UserBloc>().canRequest().isEmpty) {
                      context.read<UserBloc>().add(AddUserEvent());
                    } else {
                      showSnackBar(
                          context: context,
                          text:
                              '${context.read<UserBloc>().canRequest()} is required');
                    }
                  },
                  radius: 100.r,
                  color: AppColors.primary,
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
              Navigator.pushReplacementNamed(
                  context, RouteNames.tabBox);
            } else {
              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }
}
