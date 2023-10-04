import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/client_request_bloc/client_request_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/driver_request_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/dropdown_for_empty_place.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/request_screens/widgets/dropdown_for_request.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/ui/widgets/global_button.dart';
import 'package:taxi_app/ui/widgets/global_input.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
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
  bool isDriver = StorageRepository.getString(StorageKeys.userRole) == "driver";
  String toRegion = "Tashkent shahri";
  String tripTime = "Choose a departure time";

  Future<void> _show() async {
    Navigator.of(context).push(
      showPicker(
        context: context,
        themeData: ThemeData.from(
            colorScheme: getTheme(context)
                ? ColorScheme.dark()
                : ColorScheme.fromSeed(seedColor: Colors.white)),
        value: Time(hour: 12, minute: 0),
        sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
        sunset: const TimeOfDay(hour: 18, minute: 0), // optional
        duskSpanInMinutes: 120, // optional
        onChange: (value) {
          tripTime = "${value.hour}:${value.minute}";
          context.read<DriverRequestBloc>().add(
                UpdateCurrentDriverField(
                    fieldKey: RequestField.tripTime, value: tripTime),
              );
        },
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "Request",
      ),
      body: BlocConsumer<DriverRequestBloc, DriverRequestState>(
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
                            onChanged: (value) {
                              context.read<DriverRequestBloc>().add(
                                    UpdateCurrentDriverField(
                                        fieldKey: RequestField.description,
                                        value: value),
                                  );
                            },
                          ),
                          24.ph,
                          GlobalTextField(
                            hintText: "Request Price",
                            onChanged: (value) {
                              context.read<DriverRequestBloc>().add(
                                  UpdateCurrentDriverField(
                                      fieldKey: RequestField.requestPrice,
                                      value: int.parse(value)));
                            },
                            keyboardType: TextInputType.number,
                          ),
                          24.ph,
                          Text(isDriver ? "Empty Places" : "PassengerCount",
                              style: AppTextStyle.bodyMediumSemibold.copyWith(
                                  color: getTheme(context)
                                      ? AppColors.white
                                      : AppColors.c_900)),
                          24.ph,
                          DropDownForRequest(
                            listFromOutside: emptyPlaces,
                            itemFromOutside: emptyPlace,
                            onChanged: (newValue) {
                              setState(() {
                                emptyPlace = newValue!;
                              });
                              context.read<DriverRequestBloc>().add(
                                    UpdateCurrentDriverField(
                                        fieldKey: RequestField.emptyPlaces,
                                        value: int.parse(emptyPlace)),
                                  );
                            },
                          ),
                          24.ph,
                          GlobalButton(
                            title: tripTime,
                            onTap: () {
                              _show();
                            },
                            radius: 100.r,
                            color: AppColors.primary,
                          ),
                          24.ph,
                          Text(
                            "From",
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
                                context.read<DriverRequestBloc>().add(
                                      UpdateCurrentDriverField(
                                          fieldKey: RequestField.fromId,
                                          value: newValue.id),
                                    );
                              });
                            },
                          ),
                          24.ph,
                          Text("To",
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
                                context.read<DriverRequestBloc>().add(
                                      UpdateCurrentDriverField(
                                          fieldKey: RequestField.toId,
                                          value: newValue.id),
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
                    // if (state.priceText.isNotEmpty) {
                    if (state.requestModelDriver.tripTime.isNotEmpty) {
                      isDriver
                          ? context
                              .read<DriverRequestBloc>()
                              .add(AddDriverRequest())
                          : context.read<ClientRequestBloc>().add(
                              AddClientRequest(
                                  requestModelClient: RequestModelClient(
                                      userId: state.requestModelDriver.userId,
                                      fromId: state.requestModelDriver.fromId,
                                      toId: state.requestModelDriver.toId,
                                      description: state.descriptionText,
                                      requestPrice: int.parse(state.priceText),
                                      passengerCount:
                                          state.requestModelDriver.emptyPlaces,
                                      tripTime:
                                          state.requestModelDriver.tripTime,
                                      createdAt:
                                          state.requestModelDriver.createdAt)));
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
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         "Request Price is Empty!!!",
                    //         style: TextStyle(color: AppColors.white),
                    //       ),
                    //     ),
                    //   );
                    // }
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
          if (BlocProvider.of<ClientRequestBloc>(context).state.statusRequest ==
              FormStatus.success) {
            hideLoading(context: context);
            Navigator.pop(context);
            showErrorMessage(message: "Request Sent", context: context);
          }
          if (state.statusRequest == FormStatus.loading) {
            showLoading(context: context);
          }
          if (BlocProvider.of<ClientRequestBloc>(context).state.statusRequest ==
              FormStatus.loading) {
            showLoading(context: context);
          }
        },
      ),
    );
  }
}
