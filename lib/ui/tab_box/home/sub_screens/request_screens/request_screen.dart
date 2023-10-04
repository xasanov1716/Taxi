import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_app/blocs/client_request_bloc/client_request_bloc.dart';
import 'package:taxi_app/blocs/driver_request_bloc/driver_request_bloc.dart';
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
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/fonts/text_styles.dart';
import 'package:taxi_app/utils/formatter/price_formatter.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
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
  String fromRegion = "Tashkent shahri";
  bool isDriver = StorageRepository.getString(StorageKeys.userRole) == "driver";
  String toRegion = "Tashkent shahri";
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
            DateTime.now().toString().substring(10, 12),
          ),
          minute: int.parse(
            DateTime.now().toString().substring(14, 16),
          ),
        ),
        sunrise: const TimeOfDay(hour: 6, minute: 0),
        sunset: const TimeOfDay(hour: 18, minute: 0),
        duskSpanInMinutes: 120,
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
        body: BlocListener<ClientRequestBloc, ClientRequestState>(
          listener: (context, state) {
            if (state.statusRequest == FormStatus.success) {
              hideLoading(context: context);
              Navigator.pop(context);
              context.read<DriverRequestBloc>().clearAllState();

              showConfirmMessage(message: "Request Sent", context: context);
            }
            if (state.statusRequest == FormStatus.loading) {
              showLoading(context: context);
            }
          },
          child: BlocConsumer<DriverRequestBloc, DriverRequestState>(
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
                              SizedBox(
                                height: 140.h,
                                width: MediaQuery.of(context).size.width,
                                child: RequestTextField(
                                  maxLines: 3,
                                  maxLength: 60,
                                  hintText: "Description",
                                  onChanged: (value) {
                                    context.read<DriverRequestBloc>().add(
                                          UpdateCurrentDriverField(
                                              fieldKey:
                                                  RequestField.description,
                                              value: value),
                                        );
                                  },
                                ),
                              ),
                              24.ph,
                              RequestTextField(
                                hintText: "Request Price",
                                onChanged: (value) {
                                  context.read<DriverRequestBloc>().add(
                                      UpdateCurrentDriverField(
                                          fieldKey: RequestField.requestPrice,
                                          value: int.parse(
                                              value.replaceAll(" ", ''))));
                                },
                                keyboardType: TextInputType.number,
                                textFormatter: NumberInputFormatter(),
                              ),
                              24.ph,
                              Text(isDriver ? "Empty Places" : "PassengerCount",
                                  style: AppTextStyle.bodyMediumSemibold
                                      .copyWith(
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
                                  style: AppTextStyle.bodyMediumSemibold
                                      .copyWith(
                                          fontSize: 20.sp,
                                          color: getTheme(context)
                                              ? AppColors.white
                                              : AppColors.c_900)),
                              24.ph,
                              DropDownForFromTo(
                                listFromOutside: state.regionModels,
                                itemFromOutside: toRegion,
                                onChanged: (newValue) {
                                  context.read<DriverRequestBloc>().add(
                                        UpdateCurrentDriverField(
                                            fieldKey: RequestField.creatorName,
                                            value: BlocProvider.of<UserBloc>(
                                                    context)
                                                .state
                                                .userModel
                                                .fullName),
                                      );
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
                        if (state.requestModelDriver !=
                                const RequestModel.initial() &&
                            state.requestModelDriver.toId != 0 &&
                            state.requestModelDriver.fromId != 0) {
                          if (state.requestModelDriver.tripTime.isNotEmpty) {
                            isDriver
                                ? context
                                    .read<DriverRequestBloc>()
                                    .add(AddDriverRequest())
                                : context.read<ClientRequestBloc>().add(
                                    AddClientRequest(
                                        requestModelClient: RequestModel(
                                            status: 1,
                                            creatorName:
                                                BlocProvider.of<UserBloc>(context)
                                                    .state
                                                    .userModel
                                                    .fullName,
                                            userId:
                                                state.requestModelDriver.userId,
                                            fromId:
                                                state.requestModelDriver.fromId,
                                            toId: state.requestModelDriver.toId,
                                            description: state
                                                .requestModelDriver.description,
                                            requestPrice: state
                                                .requestModelDriver.requestPrice,
                                            passengerCount: state
                                                .requestModelDriver
                                                .passengerCount,
                                            tripTime: state
                                                .requestModelDriver.tripTime,
                                            createdAt: state.requestModelDriver
                                                .createdAt)));
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
                context.read<DriverRequestBloc>().clearAllState();

                showConfirmMessage(message: "Request Sent", context: context);
              }
              if (state.statusRequest == FormStatus.loading) {
                showLoading(context: context);
              }
            },
          ),
        ));
  }
}
