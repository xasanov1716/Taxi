import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/driver_bloc/driver_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/request_bloc.dart';
import 'package:taxi_app/blocs/user_bloc/user_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/dropdown_for_empty_place.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/dropdown_for_request.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/request_text_field.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/formatter/price_formatter.dart';
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
  List<String> emptyPlaces = ['1', '2', '3', '4', '5', '6', '7'];
  String emptyPlace = "1";
  String fromRegion = "Qayerdan jo'naysiz";
  bool isDriver = StorageRepository.getString(StorageKeys.userRole) == "driver";
  String toRegion = "Qayerga borasiz";
  String tripTime = "Choose a departure time";

  Future<void> _show() async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: true,
        themeData: ThemeData.from(
            colorScheme: getTheme(context)
                ? const ColorScheme.dark()
                : ColorScheme.fromSeed(seedColor: Colors.white)),
        value: Time(
          hour: int.parse(
            DateTime.now().toString().substring(10, 13),
          ),
          minute: int.parse(
            DateTime.now().toString().substring(14, 16),
          ),
        ),
        onChange: (value) {
          int minute = value.minute;
          String formattedMinute = minute < 10 ? '0$minute' : minute.toString();
          int hour = value.hour;
          String formattedHour = hour < 10 ? '0$hour' : hour.toString();

          tripTime = "Jo'nab ketish vaqti: $formattedHour:$formattedMinute da";
          context.read<RequestBloc>().add(
                UpdateCurrentField(
                  fieldKey: RequestField.tripTime,
                  value: "$formattedHour:$formattedMinute",
                ),
              );
        },
      ),
    );

    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    BlocProvider.of<RequestBloc>(context).add(
      UpdateCurrentField(
        fieldKey: RequestField.creatorName,
        value: StorageRepository.getString(StorageKeys.userRole) == AppConstants.client
            ? BlocProvider.of<UserBloc>(context).state.userModel.fullName
            : BlocProvider.of<DriverBloc>(context).state.driverModel.fullName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GlobalAppBar(
          title: "Request",
        ),
        body: BlocConsumer<RequestBloc, RequestState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 140.h,
                              width: MediaQuery.of(context).size.width,
                              child: RequestTextField(
                                maxLines: 3,
                                maxLength: 60,
                                hintText: "Description",
                                onChanged: (value) {
                                  context.read<RequestBloc>().add(
                                        UpdateCurrentField(
                                            fieldKey: RequestField.description, value: value),
                                      );
                                },
                              ),
                            ),
                            24.ph,
                            RequestTextField(
                              hintText: "Request Price",
                              onChanged: (value) {
                                context.read<RequestBloc>().add(UpdateCurrentField(
                                    fieldKey: RequestField.requestPrice,
                                    value: int.parse(value.replaceAll(" ", ''))));
                              },
                              keyboardType: TextInputType.number,
                              textFormatter: NumberInputFormatter(),
                            ),
                            24.ph,
                            Text(isDriver ? "Empty Places" : "PassengerCount",
                                style: AppTextStyle.bodyMediumSemibold.copyWith(
                                    color: getTheme(context) ? AppColors.white : AppColors.c_900)),
                            24.ph,
                            DropDownForRequest(
                              listFromOutside: emptyPlaces,
                              itemFromOutside: emptyPlace,
                              onChanged: (newValue) {
                                setState(() {
                                  emptyPlace = newValue!;
                                });
                                context.read<RequestBloc>().add(
                                      UpdateCurrentField(
                                          fieldKey: RequestField.emptyPlaces,
                                          value: int.parse(emptyPlace)),
                                    );
                              },
                            ),
                            24.ph,
                            InkWell(
                              onTap: _show,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                    color:
                                        getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Text(
                                    tripTime,
                                    style: tripTime.length > 5
                                        ? Theme.of(context).textTheme.titleMedium
                                        : Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                            ),
                            24.ph,
                            Text(
                              "From",
                              style: AppTextStyle.bodyMediumSemibold.copyWith(
                                fontSize: 20.sp,
                                color: getTheme(context) ? AppColors.white : AppColors.c_900,
                              ),
                            ),
                            24.ph,
                            DropDownForFromTo(
                              listFromOutside: state.regionModels,
                              itemFromOutside: fromRegion,
                              onChanged: (RegionModel newValue) {
                                setState(() {
                                  fromRegion = newValue.name;
                                  context.read<RequestBloc>().add(
                                        UpdateCurrentField(
                                            fieldKey: RequestField.fromId, value: newValue.id),
                                      );
                                });
                              },
                            ),
                            24.ph,
                            Text("To",
                                style: AppTextStyle.bodyMediumSemibold.copyWith(
                                    fontSize: 20.sp,
                                    color: getTheme(context) ? AppColors.white : AppColors.c_900)),
                            24.ph,
                            DropDownForFromTo(
                              listFromOutside: state.regionModels,
                              itemFromOutside: toRegion,
                              onChanged: (newValue) {
                                setState(() {
                                  toRegion = newValue.name;
                                  context.read<RequestBloc>().add(
                                        UpdateCurrentField(
                                            fieldKey: RequestField.toId, value: newValue.id),
                                      );
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GlobalButton(
                    title: "Send Request",
                    onTap: () {
                      if (state.requestModel != const RequestModel.initial() &&
                          state.requestModel.toId != 0 &&
                          state.requestModel.fromId != 0) {
                        if (state.requestModel.tripTime.isNotEmpty) {
                          context.read<RequestBloc>().add(AddRequest());
                          context.read<RequestBloc>().add(ClearAll());
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
                              "You didn't fill required fields!!!",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                      }
                    },
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
              context.read<RequestBloc>().add(ClearAll());

              showConfirmMessage(message: "Request Sent", context: context);
            }
            if (state.statusRequest == FormStatus.loading) {
              showLoading(context: context);
            }
          },
        ));
  }
}
