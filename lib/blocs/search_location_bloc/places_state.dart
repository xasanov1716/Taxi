part of 'places_bloc.dart';

@immutable
class PlacesState extends Equatable {
  final List<RegionModel> regions;
  final List<DistrictModel> districts;
  final List<QuarterModel> quarters;
  final List<SearchHistoryModel> history;
  final String errorText;
  final FormStatus status;
  PlacesState(
      {required this.errorText,
      required this.status,
      required this.districts,
      required this.quarters,
      required this.history,
      required this.regions});

  @override
  List<Object?> get props =>
      [regions, districts, quarters, errorText, status, history];

  PlacesState copyWith({
    List<RegionModel>? regions,
    List<DistrictModel>? districts,
    List<QuarterModel>? quarters,
    List<SearchHistoryModel>? history,
    String? errorText,
    FormStatus? status,
  }) {
    return PlacesState(
      regions: regions ?? this.regions,
      districts: districts ?? this.districts,
      quarters: quarters ?? this.quarters,
      history: history ?? this.history,
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
    );
  }

}
