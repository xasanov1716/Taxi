import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/get_client_informations_cubit/get_client_info_cubit.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/ui/tab_box/bookings/sub_screens/widgets/widgets.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientDetail extends StatelessWidget {
  const ClientDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          getTheme(context) ? Theme.of(context).scaffoldBackgroundColor : AppColors.c_100,
      appBar: AppBar(
        title: Text('Client detail', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: BlocBuilder<GetClientInfoCubit, GetClientInfoState>(
        builder: (context, state) {
          if (state is GetClientInfoSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      clientHeaderInfoWidget(context, state.user),
                      userBodyInfoWidget(context, state.user),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 36),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    // color: getTheme(context) ? AppColors.dark3 : AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconContainerWidget(icon: AppIcons.message, onTap: () {}),
                      24.pw,
                      IconContainerWidget(
                          icon: AppIcons.call,
                          onTap: () {
                            launchUrl(Uri(scheme: 'tel', path: state.user.phone));
                          }),
                    ],
                  ),
                )
              ],
            );
          } else if (state is GetClientInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetClientInfoError) {
            return Center(child: Text(state.errorMessage));
          }
          return Center(child: Text(state.toString()));
        },
      ),
    );
  }

  Container userBodyInfoWidget(BuildContext context, UserModel user) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: getTheme(context) ? AppColors.dark3 : AppColors.white,
      ),
      child: Column(
        children: [
          customLabelRow(context, 'Address', user.addressText),
          20.ph,
          customLabelRow(context, 'Email', user.emailAddress),
          20.ph,
          customLabelRow(context, 'Gender', user.gender),
        ],
      ),
    );
  }

  Column clientHeaderInfoWidget(BuildContext context, UserModel user) {
    return Column(
      children: [
        Container(
          width: 120,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
          ),
          child: CachedNetworkImage(
            imageUrl: user.image,
            errorWidget: (context, url, error) {
              return NamePlaceholder(name: user.fullName);
            },
          ),
        ),
        20.ph,
        Text(
          user.fullName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.phone,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    )),
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: user.phone));
                Fluttertoast.showToast(
                    msg: '✅ Copy phone number: ${user.phone}',
                    backgroundColor: AppColors.success,
                    toastLength: Toast.LENGTH_LONG);
              },
              icon: SvgPicture.asset(AppIcons.copy),
              splashRadius: 30,
            )
          ],
        ),
      ],
    );
  }
}
