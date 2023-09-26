import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/cubits/user/user_cubit.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String region = "Tashkent";
  String district = "Tashkent";
  String quarter = "Tashkent";
  List<String> regions = [];
  List<RegionModel> regionModels= [];
  List<DistrictModel> districtsModel = [];
  List<String> districts = [];
  List<QuarterModel> quartersModel = [];
  List<String> quarters = [];
  int regionId=0;
  int districtId=0;
  bool isDistrictVisible=false;
  bool isQuarterVisible=false;
  _init()async{
    regionModels= (await PlacesDatabase.instance.getAllRegions()as List<RegionModel>).map((e) => e).toList();
    _getStringLists();
  }

  _getStringLists(){
    regions=regionModels.map((e) => e.name).toList();
    districts=districtsModel.map((e) => e.name).toList();
    quarters=quartersModel.map((e) => e.name).toList();
    setState(() {

    });
  }

  _getDistricts({required int id})async{
    districts= (await PlacesDatabase.instance.getDistrictById(id: id)as List<DistrictModel>).map((e) => e.name).toList();
    district=districts.first;
    setState(() {

    });
  }

  _getQuarter({required int id})async{
    quarters = (await PlacesDatabase.instance.getQuarterById(id: id)as List<QuarterModel>).map((e) => e.name).toList();
    quarter=quarters.first;
    setState(() {

    });
  }

  _getRegionId(String name){
     for (var element in regionModels) {
       if(element.name==name){
         regionId=element.id;
       }
     }
     setState(() {

     });
  }

  _getDistrictId(String name){
    for (var element in districtsModel) {
      if(element.name==name){
        districtId=element.id;
      }
    }
    setState(() {

    });
  }

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
        Text("From",style: AppTextStyle.bodyMediumSemibold.copyWith(
          fontSize: 20.sp,
            color: getTheme(context)
                ? AppColors.white
                : AppColors.c_900)),
        24.ph,
        Text("Region",style: AppTextStyle.bodyMediumSemibold.copyWith(
            color: getTheme(context)
                ? AppColors.white
                : AppColors.c_900)),
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
            items: regions.map((String items) {
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
              setState(()  {
                region = newValue!;
                _getRegionId(region);
                _getDistricts(id: regionId);
                isDistrictVisible=true;
              });
              // context.read<UserCubit>().updateCurrentUserField(
              //     fieldKey: UserFieldKeys.gender, value: newValue);
            },
            hint: Text(region,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Visibility(
          visible: isDistrictVisible,
          child: Text("District",style: AppTextStyle.bodyMediumSemibold.copyWith(
              color: getTheme(context)
                  ? AppColors.white
                  : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: isDistrictVisible,
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
              items: districts.map((String items) {
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
                  district = newValue!;
                  _getDistrictId(district);
                  _getQuarter(id: districtId);
                  isQuarterVisible=true;
                });
                // context.read<UserCubit>().updateCurrentUserField(
                //     fieldKey: UserFieldKeys.gender, value: newValue);
              },
              hint: Text(district,
                  style: AppTextStyle.bodyMediumSemibold.copyWith(
                      color: getTheme(context)
                          ? AppColors.white
                          : AppColors.c_900)), // Placeholder text
            ),
          ),
        ),
        24.ph,
        Visibility(
          visible: isQuarterVisible,
          child: Text("Quarter",style: AppTextStyle.bodyMediumSemibold.copyWith(
              color: getTheme(context)
                  ? AppColors.white
                  : AppColors.c_900)),
        ),
        24.ph,
        Visibility(
          visible: isQuarterVisible,
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
              items: quarters.map((String items) {
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
                  quarter = newValue!;
                });
                context.read<UserCubit>().updateCurrentUserField(
                    fieldKey: UserFieldKeys.gender, value: newValue);
              },
              hint: Text(quarter,
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
}
