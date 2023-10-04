part of 'driver_request_bloc.dart';

class DriverRequestState extends Equatable {
  const DriverRequestState({
    this.errorText = '',
    this.statusRequest = FormStatus.pure,



    required this.regionModels,
    required this.descriptionText,
    required this.priceText,
    this.requestModelDriver = const RequestModelDriver.initial(),
  });
  final List<RegionModel> regionModels;
  final String errorText;
  final FormStatus statusRequest;
  final RequestModelDriver requestModelDriver;
  final String descriptionText;
  final String priceText;

  DriverRequestState copyWith({
    String? errorText,
    String? descriptionText,
    String? priceText,
    FormStatus? statusRequest,
    RequestModelDriver? requestModelDriver,
    List<RegionModel>? regionModels,
  }) =>
      DriverRequestState(
        errorText: errorText ?? this.errorText,
        priceText: priceText ?? this.priceText,
        descriptionText: descriptionText ?? this.descriptionText,
        statusRequest: statusRequest ?? this.statusRequest,
        requestModelDriver: requestModelDriver ?? this.requestModelDriver,
        regionModels: regionModels ?? this.regionModels,
      );

  @override
  List<Object?> get props => [
        errorText,
        statusRequest,
        requestModelDriver,
        descriptionText,
        priceText,
        regionModels,
      ];
}
