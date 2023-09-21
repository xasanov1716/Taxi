import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/create_order/create_order_bloc.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/app_routes.dart';
import 'package:taxi_app/ui/create_order/sub_screens/select_transport/widgets/select_transport_functions.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SecondHalfOfTransportScreen extends StatelessWidget {
  const SecondHalfOfTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 185 * height / figmaHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: getTheme(context) ? AppColors.dark2 : AppColors.c_50,
                  ),
                  child: BlocBuilder<CreateOrderBloc, CreateOrderState>(
                    builder: (context, state) {
                      if (state.promoCodeList.isEmpty) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                width: 300 * width / figmaWidth,
                                child: const GlobalTextField(
                                    hintText: 'Enter Promo Code')),
                            10.pw,
                            getPlusButton(() {
                              Navigator.pushNamed(
                                  context, RouteNames.addPromo);
                            }, context),
                          ],
                        );
                      }
                      if (state.promoCodeList.isNotEmpty) {
                        return ListView(
                          children: [
                            Wrap(
                              runSpacing: 10.h,
                              spacing: 10.w,
                              children: [
                                ...List.generate(
                                  state.promoCodeList.length,
                                  (index) {
                                    var promoCode =
                                        state.promoCodeList[index];
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        color: AppColors.primary,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            promoCode,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.dark3,
                                                ),
                                          ),
                                          4.pw,
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<CreateOrderBloc>()
                                                  .add(ClearPromoCodes(
                                                      index: promoCode));
                                            },
                                            child: SvgPicture.asset(
                                              AppIcons.getSvg(
                                                name: AppIcons.closeSquare,
                                                iconType:
                                                    IconType.lightOutline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                getPlusButton(() {
                                  Navigator.pushNamed(
                                      context, RouteNames.addPromo);
                                }, context),
                              ],
                            )
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
