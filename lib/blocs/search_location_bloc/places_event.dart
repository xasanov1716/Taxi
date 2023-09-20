part of 'places_bloc.dart';

@immutable
abstract class PlacesEvent extends Equatable {}

// class FetchAllRegionsEvent extends PlacesEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class FetchAllDistrictsEvent extends PlacesEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class FetchAllQuartersEvent extends PlacesEvent {
//   @override
//   List<Object?> get props => [];
// }

class SearchRegionsByNameEvent extends PlacesEvent {
  final String query;

  SearchRegionsByNameEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchDistrictsByNameEvent extends PlacesEvent {
  final String query;

  SearchDistrictsByNameEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchQuartersByNameEvent extends PlacesEvent {
  final String query;

  SearchQuartersByNameEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class GetSearchHistoryEvent extends PlacesEvent {
  final int limit;

  GetSearchHistoryEvent(this.limit);
  @override
  List<Object?> get props => [limit];
}

class CreateSearchHistoryEvent extends PlacesEvent {
  final String query;

  CreateSearchHistoryEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class UpdateQueryEvent extends PlacesEvent {
  final String query;

  UpdateQueryEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearchHistoryEvent extends PlacesEvent {
  @override
  List<Object?> get props => [];
}
