import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key, this.isFromAuth});
  final bool? isFromAuth;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String fromRegion = "Tashkent";
  String fromDistrict = "Tashkent";
  String fromQuarter = "Tashkent";
  List<String> fromRegions = [];
  List<RegionModel> fromRegionModels = [];
  List<DistrictModel> fromDistrictsModel = [];
  List<String> fromDistricts = [];
  List<QuarterModel> fromQuartersModel = [];
  List<String> fromQuarters = [];
  List<int> from = [];
  List<int> to = [];
  int fromRegionId = 0;
  int fromDistrictId = 0;
  bool isFromDistrictVisible = false;
  bool isFromQuarterVisible = false;

  String toRegion = "Tashkent";
  String toDistrict = "Tashkent";
  String toQuarter = "Tashkent";
  List<String> toRegions = [];
  List<RegionModel> toRegionModels = [];
  List<DistrictModel> toDistrictsModel = [];
  List<String> toDistricts = [];
  List<QuarterModel> toQuartersModel = [];
  List<String> toQuarters = [];
  int toRegionId = 0;
  int toDistrictId = 0;
  bool istoDistrictVisible = false;
  bool istoQuarterVisible = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  final FocusNode priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [

        24.ph,
        Text("From",
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                fontSize: 20.sp,
                color: getTheme(context) ? AppColors.white : AppColors.c_900)),
        24.ph,
        Text("Region",
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                color: getTheme(context) ? AppColors.white : AppColors.c_900)),
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: getTheme(context)
                ? AppColors.dark2
                : AppColors.greysCale,
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor:
                getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
            icon: SvgPicture.asset(
              AppIcons.getSvg(
                  name: AppIcons.arrowDown2, iconType: IconType.bold),
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn),
            ),
            borderRadius: BorderRadius.circular(12.r),
            items: fromRegions.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                fromRegion = newValue!;
                _getFromRegionId(fromRegion);
                _getFromDistricts(id: fromRegionId);
                isFromDistrictVisible = true;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.from, value: fromRegionId);
            },
            hint: Text(fromRegion,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Visibility(
          visible: isFromDistrictVisible,
          child: Text("District",
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color:
                      getTheme(context) ? AppColors.white : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: isFromDistrictVisible,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: getTheme(context)
                  ? AppColors.dark2
                  : AppColors.greysCale, // Use the desired background color
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                    name: AppIcons.arrowDown2, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
              borderRadius: BorderRadius.circular(12.r),
              items: fromDistricts.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: AppTextStyle.bodyMediumSemibold.copyWith(
                        color: getTheme(context)
                            ? AppColors.white
                            : AppColors.c_900),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  fromDistrict = newValue!;
                  _getFromDistrictId(fromDistrict);
                  _getFromQuarter(id: fromDistrictId);
                  isFromQuarterVisible = true;
                });
                context.read<DriverBloc>().updateDriverField(
                    fieldKey: DriverFieldKeys.from, value: fromRegionId);
              },
              hint: Text(fromDistrict,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900)), // Placeholder text
            ),
          ),
        ),
        24.ph,
        Visibility(
          visible: isFromQuarterVisible,
          child: Text("Quarter",
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color:
                      getTheme(context) ? AppColors.white : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: isFromQuarterVisible,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: getTheme(context)
                  ? AppColors.dark2
                  : AppColors.greysCale, // Use the desired background color
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                    name: AppIcons.arrowDown2, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
              borderRadius: BorderRadius.circular(12.r),
              items: fromQuarters.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: AppTextStyle.bodyMediumSemibold.copyWith(
                        color: getTheme(context)
                            ? AppColors.white
                            : AppColors.c_900),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) async {
                setState(() {
                  fromQuarter = newValue!;
                });
                await _getFromQuarterId(newValue!);
                if (context.mounted) {
                  context.read<DriverBloc>().updateDriverField(
                      fieldKey: DriverFieldKeys.from, value: fromRegionId);
                }
              },
              hint: Text(fromQuarter,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900)), // Placeholder text
            ),
          ),
        ),
        24.ph,
        Text("To",
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                fontSize: 20.sp,
                color: getTheme(context) ? AppColors.white : AppColors.c_900)),
        24.ph,
        Text("Region",
            style: AppTextStyle.bodyMediumSemibold.copyWith(
                color: getTheme(context) ? AppColors.white : AppColors.c_900)),
        24.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: getTheme(context)
                ? AppColors.dark2
                : AppColors.greysCale, // Use the desired background color
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor:
                getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
            icon: SvgPicture.asset(
              AppIcons.getSvg(
                  name: AppIcons.arrowDown2, iconType: IconType.bold),
              colorFilter: ColorFilter.mode(
                  getTheme(context) ? AppColors.white : AppColors.c_900,
                  BlendMode.srcIn),
            ),
            borderRadius: BorderRadius.circular(12.r),
            items: toRegions.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                toRegion = newValue!;
                _getToRegionId(toRegion);
                _getToDistricts(id: toRegionId);
                istoDistrictVisible = true;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.to, value: toRegionId);

              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.fromToText,
                  value: '$fromRegion to $toRegion');
            },
            hint: Text(toRegion,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Visibility(
          visible: istoDistrictVisible,
          child: Text("District",
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color:
                      getTheme(context) ? AppColors.white : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: istoDistrictVisible,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: getTheme(context)
                  ? AppColors.dark2
                  : AppColors.greysCale, // Use the desired background color
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                    name: AppIcons.arrowDown2, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
              borderRadius: BorderRadius.circular(12.r),
              items: toDistricts.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: AppTextStyle.bodyMediumSemibold.copyWith(
                        color: getTheme(context)
                            ? AppColors.white
                            : AppColors.c_900),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  toDistrict = newValue!;
                  _getToDistrictId(toDistrict);
                  _getToQuarter(id: toDistrictId);
                  istoQuarterVisible = true;
                });
                context.read<DriverBloc>().updateDriverField(
                    fieldKey: DriverFieldKeys.to, value: toRegionId);
              },
              hint: Text(toDistrict,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900)), // Placeholder text
            ),
          ),
        ),
        24.ph,
        Visibility(
          visible: istoQuarterVisible,
          child: Text("Quarter",
              style: AppTextStyle.bodyMediumSemibold.copyWith(
                  color:
                      getTheme(context) ? AppColors.white : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: istoQuarterVisible,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: getTheme(context)
                  ? AppColors.dark2
                  : AppColors.greysCale, // Use the desired background color
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
              icon: SvgPicture.asset(
                AppIcons.getSvg(
                    name: AppIcons.arrowDown2, iconType: IconType.bold),
                colorFilter: ColorFilter.mode(
                    getTheme(context) ? AppColors.white : AppColors.c_900,
                    BlendMode.srcIn),
              ),
              borderRadius: BorderRadius.circular(12.r),
              items: toQuarters.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: AppTextStyle.bodyMediumSemibold.copyWith(
                        color: getTheme(context)
                            ? AppColors.white
                            : AppColors.c_900),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) async {
                setState(() {
                  toQuarter = newValue!;
                });
                await _getToQuarterId(newValue!);
                if (context.mounted) {
                  context.read<DriverBloc>().updateDriverField(
                      fieldKey: DriverFieldKeys.to, value: toRegionId);
                }
              },
              hint: Text(toQuarter,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900)), // Placeholder text
            ),
          ),
        ),
        24.ph,
      ],
    );
  }



  _init() async {
    fromRegionModels =
        (await PlacesDatabase.instance.getAllRegions()).map((e) => e).toList();
    toRegionModels =
        (await PlacesDatabase.instance.getAllRegions()).map((e) => e).toList();
    _getStringLists();
  }

  _getStringLists() {
    fromRegions = fromRegionModels.map((e) => e.name).toList();
    fromDistricts = fromDistrictsModel.map((e) => e.name).toList();
    fromQuarters = fromQuartersModel.map((e) => e.name).toList();
    toRegions = fromRegionModels.map((e) => e.name).toList();
    toDistricts = fromDistrictsModel.map((e) => e.name).toList();
    toQuarters = fromQuartersModel.map((e) => e.name).toList();
    setState(() {});
  }

  _getFromDistricts({required int id}) async {
    fromDistricts = (await PlacesDatabase.instance.getDistrictById(id: id))
        .map((e) => e.name)
        .toList();
    fromDistrict = fromDistricts.first;
    setState(() {});
  }

  _getFromQuarter({required int id}) async {
    fromQuarters = (await PlacesDatabase.instance.getQuarterById(id: id))
        .map((e) => e.name)
        .toList();
    fromQuarter = fromQuarters.first;
    setState(() {});
  }

  _getFromRegionId(String name) {
    for (var element in fromRegionModels) {
      if (element.name == name) {
        fromRegionId = element.id;
      }
    }
    setState(() {});
  }

  _getFromDistrictId(String name) {
    for (var element in fromDistrictsModel) {
      if (element.name == name) {
        fromDistrictId = element.id;
      }
    }
    setState(() {});
  }

  _getFromQuarterId(String name) {
    for (var element in fromQuartersModel) {
      if (element.name == name) {
        from = [element.id, element.districtId, fromRegionId];
      }
    }
    setState(() {});
  }

  _getToDistricts({required int id}) async {
    toDistricts = (await PlacesDatabase.instance.getDistrictById(id: id))
        .map((e) => e.name)
        .toList();
    toDistrict = toDistricts.first;
    setState(() {});
  }

  _getToQuarter({required int id}) async {
    toQuarters = (await PlacesDatabase.instance.getQuarterById(id: id))
        .map((e) => e.name)
        .toList();
    toQuarter = toQuarters.first;
    setState(() {});
  }

  _getToQuarterId(String name) {
    for (var element in toQuartersModel) {
      if (element.name == name) {
        to = [element.id, element.districtId, toRegionId];
      }
    }
    setState(() {});
  }

  _getToRegionId(String name) {
    for (var element in toRegionModels) {
      if (element.name == name) {
        toRegionId = element.id;
      }
    }
    setState(() {});
  }

  _getToDistrictId(String name) {
    for (var element in toDistrictsModel) {
      if (element.name == name) {
        toDistrictId = element.id;
      }
    }
    setState(() {});
  }

}
