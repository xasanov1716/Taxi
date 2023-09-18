part of 'places_bloc.dart';

@immutable
class PlacesState extends Equatable {
  final List<RegionModel> regions;
  final List<DistrictModel> districts;
  final List<QuarterModel> quarters;
  final List<SearchHistoryModel> history;
  final String query;
  final String errorText;
  final FormStatus status;
  const PlacesState(
      {required this.query,
      required this.errorText,
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
    String? query,
    FormStatus? status,
  }) {
    return PlacesState(
      regions: regions ?? this.regions,
      query: query ?? this.query,
      districts: districts ?? this.districts,
      quarters: quarters ?? this.quarters,
      history: history ?? this.history,
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
    );
  }
}
