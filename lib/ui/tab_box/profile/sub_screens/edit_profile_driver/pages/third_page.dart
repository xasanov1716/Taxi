import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/request_bloc.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/dropdown_for_request.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key, this.isFromAuth});
  final bool? isFromAuth;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String fromRegion = tr('where_are_you_leaving');
  String toRegion = tr('where_are_you_going');

  final FocusNode priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestBloc, RequestState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                   tr('from'),
                          style: AppTextStyle.bodyMediumSemibold.copyWith(
                            fontSize: 20.sp,
                            color: getTheme(context)
                                ? AppColors.white
                                : AppColors.c_900,
                          ),
                        ),
                        24.ph,
                        DropDownForFromTo(
                          listFromOutside: state.regionModels,
                          itemFromOutside: fromRegion,
                          onChanged: (RegionModel newValue) {
                            setState(() {
                              fromRegion = newValue.name;
                              context.read<DriverBloc>().updateDriverField(
                                  fieldKey: DriverFieldKeys.from, value: newValue.id);
                            });
                          },
                        ),
                        24.ph,
                        Text(tr('to'),
                            style: AppTextStyle.bodyMediumSemibold.copyWith(
                                fontSize: 20.sp,
                                color: getTheme(context)
                                    ? AppColors.white
                                    : AppColors.c_900)),
                        24.ph,
                        DropDownForFromTo(
                          listFromOutside: state.regionModels,
                          itemFromOutside: toRegion,
                          onChanged: (newValue) {
                            setState(() {
                              toRegion = newValue.name;
                              context.read<DriverBloc>().updateDriverField(
                                  fieldKey: DriverFieldKeys.to, value: newValue.id);
                            });
                          },
                        ),
                        24.ph,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            12.ph,
            12.ph
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
