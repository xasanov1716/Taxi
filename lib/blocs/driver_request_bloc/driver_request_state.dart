part of 'driver_request_bloc.dart';

class DriverRequestState extends Equatable {
  const DriverRequestState({
    this.errorText = '',
    this.statusRequest = FormStatus.pure,
    required this.fromRegions,
    required this.fromRegionModels,
    required this.toRegions,
    required this.toRegionModels,
    required this.descriptionText,
    required this.priceText,
    this.requestModelDriver = const RequestModelDriver.initial(),
  });
  final List<String> fromRegions;
  final List<RegionModel> fromRegionModels;
  final List<String> toRegions;
  final List<RegionModel> toRegionModels;
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
    List<String>? fromRegions,
    List<RegionModel>? fromRegionModels,
    List<String>? toRegions,
    List<RegionModel>? toRegionModels,
  }) =>
      DriverRequestState(
        errorText: errorText ?? this.errorText,
        priceText: priceText ?? this.priceText,
        descriptionText: descriptionText ?? this.descriptionText,
        statusRequest: statusRequest ?? this.statusRequest,
        requestModelDriver: requestModelDriver ?? this.requestModelDriver,
        fromRegions: fromRegions ?? this.fromRegions,
        fromRegionModels: fromRegionModels ?? this.fromRegionModels,
        toRegions: toRegions ?? this.toRegions,
        toRegionModels: toRegionModels ?? this.toRegionModels,
      );

  @override
  List<Object?> get props => [
        errorText,
        statusRequest,
        requestModelDriver,
        descriptionText,
        priceText,
        toRegionModels,
        toRegions,
        fromRegions,
        fromRegionModels,
      ];
}
