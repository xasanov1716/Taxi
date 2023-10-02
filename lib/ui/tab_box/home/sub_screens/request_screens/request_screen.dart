import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taxi_app/blocs/client_request_bloc/client_request_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/driver_request_bloc.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'package:taxi_app/utils/ui_utils/error_message_dialog.dart';
import 'package:taxi_app/utils/ui_utils/loading_dialog.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  var emptyPlaces = ['1', '2', '3', '4', '5', '6', '7'];
  String emptyPlace = "1";
  String fromRegion = "Tashkent shahri";
  List<String> fromRegions = [];
  List<RegionModel> fromRegionModels = [];
  List<int> from = [];
  List<int> to = [];
  int fromRegionId = 13;
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  RequestModelDriver requestModelDriver = const RequestModelDriver.initial();
  RequestModelClient requestModelClient = const RequestModelClient.initial();
  bool isDriver = StorageRepository.getString(StorageKeys.userRole) == "driver";

  String toRegion = "Tashkent shahri";
  List<String> toRegions = [];
  List<RegionModel> toRegionModels = [];
  int toRegionId = 13;

  var pricerFormatter = MaskTextInputFormatter(
      mask: '#########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
   String tripTime="Choose a departure time";

  Future<void> _show()async{
   tripTime = (await showTimePicker(context: context, initialTime: TimeOfDay.now(),initialEntryMode: TimePickerEntryMode.input,)).toString().substring(10,15);
   setState(() {

   });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "Request",
      ),
      body: BlocConsumer<DriverRequestBloc,DriverRequestState>(
        builder: (context, state) {
            return Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalTextField(
                            hintText: "Description",
                            controller: desc,
                          ),
                          24.ph,
                          GlobalTextField(
                            maskFormatter: pricerFormatter,
                            hintText: "Request Price",
                            controller: price,
                            keyboardType: TextInputType.number,
                          ),
                          24.ph,
                          Text(isDriver ? "Empty Places" : "PassengerCount",
                              style: AppTextStyle.bodyMediumSemibold.copyWith(
                                  color: getTheme(context)
                                      ? AppColors.white
                                      : AppColors.c_900)),
                          24.ph,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors
                                      .greysCale, // Use the desired background color
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              dropdownColor: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors.greysCale,
                              icon: SvgPicture.asset(
                                AppIcons.getSvg(
                                    name: AppIcons.arrowDown2,
                                    iconType: IconType.bold),
                                colorFilter: ColorFilter.mode(
                                    getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_900,
                                    BlendMode.srcIn),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              items: emptyPlaces.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyle.bodyMediumSemibold
                                        .copyWith(
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
                                requestModelDriver.copyWith(
                                    emptyPlaces: int.parse(emptyPlace));
                              },
                              hint: Text(emptyPlace,
                                  style: AppTextStyle.bodyMediumSemibold
                                      .copyWith(
                                          color: getTheme(context)
                                              ? AppColors.white
                                              : AppColors
                                                  .c_900)), // Placeholder text
                            ),
                          ),
                          24.ph,
                          GlobalButton(title: tripTime, onTap: (){
                           _show();
                          }, radius: 100.r,color: AppColors.primary,),
                          24.ph,
                          Text("From",
                              style: AppTextStyle.bodyMediumSemibold.copyWith(
                                  fontSize: 20.sp,
                                  color: getTheme(context)
                                      ? AppColors.white
                                      : AppColors.c_900)),
                          24.ph,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors.greysCale,
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              dropdownColor: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors.greysCale,
                              icon: SvgPicture.asset(
                                AppIcons.getSvg(
                                    name: AppIcons.arrowDown2,
                                    iconType: IconType.bold),
                                colorFilter: ColorFilter.mode(
                                    getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_900,
                                    BlendMode.srcIn),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              items: fromRegions.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyle.bodyMediumSemibold
                                        .copyWith(
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
                                });
                                requestModelDriver.copyWith(
                                    fromId: fromRegionId);
                              },
                              hint: Text(fromRegion,
                                  style: AppTextStyle.bodyMediumSemibold
                                      .copyWith(
                                          color: getTheme(context)
                                              ? AppColors.white
                                              : AppColors
                                                  .c_900)), // Placeholder text
                            ),
                          ),
                          24.ph,
                          Text("To",
                              style: AppTextStyle.bodyMediumSemibold.copyWith(
                                  fontSize: 20.sp,
                                  color: getTheme(context)
                                      ? AppColors.white
                                      : AppColors.c_900)),
                          24.ph,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors
                                      .greysCale, // Use the desired background color
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              dropdownColor: getTheme(context)
                                  ? AppColors.dark2
                                  : AppColors.greysCale,
                              icon: SvgPicture.asset(
                                AppIcons.getSvg(
                                    name: AppIcons.arrowDown2,
                                    iconType: IconType.bold),
                                colorFilter: ColorFilter.mode(
                                    getTheme(context)
                                        ? AppColors.white
                                        : AppColors.c_900,
                                    BlendMode.srcIn),
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                              items: toRegions.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: AppTextStyle.bodyMediumSemibold
                                        .copyWith(
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
                                });
                                requestModelDriver.copyWith(toId: toRegionId);
                              },
                              hint: Text(toRegion,
                                  style: AppTextStyle.bodyMediumSemibold
                                      .copyWith(
                                          color: getTheme(context)
                                              ? AppColors.white
                                              : AppColors
                                                  .c_900)), // Placeholder text
                            ),
                          ),
                          24.ph,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              12.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GlobalButton(
                  title: "Send Request",
                  onTap: () {
                      if (price.text.isNotEmpty) {
                        if (tripTime.isNotEmpty) {
                          debugPrint(requestModelDriver.toString());
                   isDriver?context.read<DriverRequestBloc>().add(
                                AddDriverRequest(
                                  requestModelDriver:
                                      requestModelDriver.copyWith(
                                    createdAt: DateTime.now().second,
                                    description: desc.text,
                                    requestPrice: int.parse(price.text),
                                    fromId: fromRegionId,
                                    toId: toRegionId,
                                    tripTime: tripTime,
                                    emptyPlaces: int.parse(emptyPlace),
                                  ),
                                ),
                              ):
                          BlocProvider.of<ClientRequestBloc>(context).add(AddClientRequest(
                            requestModelClient:
                            requestModelClient.copyWith(
                              createdAt: DateTime.now().second,
                              description: desc.text,
                              requestPrice: int.parse(price.text),
                              fromId: fromRegionId,
                              toId: toRegionId,
                              tripTime: tripTime,
                              passengerCount: int.parse(emptyPlace),
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Trip Time is Empty!!!",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Request Price is Empty!!!",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                      }
                    },
                  color: AppColors.primary,
                  radius: 100.r,
                ),
              ),
              12.ph
            ],
          );
        },
        listener: (context, state) {
          if (state.statusRequest == FormStatus.success) {
            hideLoading(context: context);
            Navigator.pop(context);
            showConfirmMessage(message: "Request Sent", context: context);
          }
          if(BlocProvider.of<ClientRequestBloc>(context).state.statusRequest == FormStatus.success){
              hideLoading(context: context);
              Navigator.pop(context);
              showErrorMessage(message: "Request Sent", context: context);
          }
          if(state.statusRequest == FormStatus.loading){
            showLoading(context: context);
          }
          if(BlocProvider.of<ClientRequestBloc>(context).state.statusRequest == FormStatus.loading){
            showLoading(context: context);
          }

        },
      ),
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
    toRegions = fromRegionModels.map((e) => e.name).toList();
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

  _getToRegionId(String name) {
    for (var element in toRegionModels) {
      if (element.name == name) {
        toRegionId = element.id;
      }
    }
    setState(() {});
  }
}
