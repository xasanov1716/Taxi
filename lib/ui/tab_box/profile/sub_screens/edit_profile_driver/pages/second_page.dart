import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/formatter/price_formatter.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key,required this.isFromAuth});
  final bool isFromAuth;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController priceController = TextEditingController();
  initStateToText() {
    DriverState state = context.read<DriverBloc>().state;

    priceController.text = state.driverModel.price.toString();
    gender = state.driverModel.gender;
    carModel = state.driverModel.carModel;
    emptyPlace = state.driverModel.emptyPlaces.toString();
    hasRoof = state.driverModel.hasRoofTop ? "Yes" : "No";
  }


  @override
  void initState() {
    if(widget.isFromAuth) initStateToText();
    super.initState();
  }

  String gender = "Male";
  String carModel = "Damas";
  String hasRoof = "Yes";
  String emptyPlace = "1";
  var genders = ['Male', 'Female', 'Mixed'];
  var hasRoofs = [
    'Yes',
    'No',
  ];
  var emptyPlaces = ['1', '2', '3', '4', '5', '6', '7'];
  var carModels = [
    'Damas',
    'Tiko',
    'Matiz',
    'Nexia',
    'Nexia 2',
    'Nexia 3',
    'Cobalt',
    'Lacetti',
    'Gentra',
    'Malibu',
    'Spark'
  ];

  final FocusNode priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        24.ph,
        GlobalTextField(
          focusNode: priceFocusNode,
          hintText: 'Price',
          keyboardType: TextInputType.number,
          maskFormatter: NumberInputFormatter(),
          maxLength: 10,
          suffixIcon: Padding(
            padding:  EdgeInsets.only(right: 10.w,top: 10.h),
            child: Text("so'm",style: Theme.of(context).textTheme.titleLarge,),
          ),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context.read<DriverBloc>().updateDriverField(
                fieldKey: DriverFieldKeys.price, value: int.parse(value));
          },
        ),
        24.ph,
        Text("Passenger Type",
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
            items: genders.map((String items) {
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
                gender = newValue!;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.passengerType, value: gender);
            },
            hint: Text(gender,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Text("Car Model",
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
            items: carModels.map((String items) {
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
                carModel = newValue!;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.carModel, value: carModel);
            },
            hint: Text(carModel,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Text("Has Roof",
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
            items: hasRoofs.map((String items) {
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
                hasRoof = newValue!;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.hasRoofTop,
                  value: hasRoof == "Yes" ? true : false);
            },
            hint: Text(hasRoof,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph,
        Text("Empty Places",
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
            items: emptyPlaces.map((String items) {
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
                emptyPlace = newValue!;
              });
              context.read<DriverBloc>().updateDriverField(
                  fieldKey: DriverFieldKeys.emptyPlaces,
                  value: int.parse(emptyPlace));
            },
            hint: Text(emptyPlace,
                style: AppTextStyle.bodyMediumSemibold.copyWith(
                    color: getTheme(context)
                        ? AppColors.white
                        : AppColors.c_900)), // Placeholder text
          ),
        ),
        24.ph
      ],
    );
  }
}
