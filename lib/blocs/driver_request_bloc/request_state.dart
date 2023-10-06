part of 'request_bloc.dart';

class RequestState extends Equatable {
  const RequestState({
    this.errorText = '',
    this.statusRequest = FormStatus.pure,



    required this.regionModels,
    required this.descriptionText,
    required this.priceText,
    this.requestModel = const RequestModel.initial(),
  });
  final List<RegionModel> regionModels;
  final String errorText;
  final FormStatus statusRequest;
  final RequestModel requestModel;
  final String descriptionText;
  final String priceText;

  RequestState copyWith({
    String? errorText,
    String? descriptionText,
    String? priceText,
    FormStatus? statusRequest,
    RequestModel? requestModel,
    List<RegionModel>? regionModels,
  }) =>
      RequestState(
        errorText: errorText ?? this.errorText,
        priceText: priceText ?? this.priceText,
        descriptionText: descriptionText ?? this.descriptionText,
        statusRequest: statusRequest ?? this.statusRequest,
        requestModel: requestModel ?? this.requestModel,
        regionModels: regionModels ?? this.regionModels,
      );

  @override
  List<Object?> get props => [
        errorText,
        statusRequest,
        requestModel,
        descriptionText,
        priceText,
        regionModels,
      ];
}
