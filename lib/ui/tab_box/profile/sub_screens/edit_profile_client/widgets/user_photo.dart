import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100 * width / figmaWidth,
            width: 100 * width / figmaWidth,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.c_50,
            ),
            child: Stack(
              children: [
                BlocBuilder<UserBloc, UsersState>(
                  builder: (context, state) {
                    return Center(
                      child: state.userModel.image.isEmpty
                          ? Image.asset(
                              AppIcons.emptyProfile,
                              height: 100 * width / figmaWidth,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.network(
                                state.userModel.image,
                                height: 100 * width / figmaWidth,
                                width: 100 * width / figmaWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    AppIcons.getSvg(
                      name: AppIcons.editSquare,
                      iconType: IconType.bold,
                    ),
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
