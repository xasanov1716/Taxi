import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/places/district_model.dart';
import 'package:taxi_app/data/models/places/quarter_model.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/search_history/search_history_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/places_db_repository.dart';
import 'package:taxi_app/data/repositories/search_history_db.dart';

part 'places_event.dart';
part 'places_state.dart';

class SearchLocationBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesDatabaseRepository placesDatabaseRepository;
  final SearchHistoryRepository searchHistoryRepository;
  SearchLocationBloc({
    required this.searchHistoryRepository,
    required this.placesDatabaseRepository,
  }) : super(const PlacesState(
          query: '',
          status: FormStatus.pure,
          districts: [],
          errorText: '',
          history: [],
          quarters: [],
          regions: [],
        )) {
    on<SearchRegionsByNameEvent>(_searchByRegion);
    on<SearchDistrictsByNameEvent>(_searchByDistrict);
    on<SearchQuartersByNameEvent>(_searchByQuarter);
    on<GetSearchHistoryEvent>(_getSearchHistoryByLimit);
    on<CreateSearchHistoryEvent>(_createSearchHistory);
    on<ClearSearchHistoryEvent>(_clearSearchHistory);
    on<UpdateQueryEvent>(_updateQuery);
  }

  Future<void> _searchByRegion(
      SearchRegionsByNameEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data =
        await placesDatabaseRepository.searchRegionsByName(event.query);
    List<RegionModel> datas = data.data;
    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          regions: datas, status: FormStatus.success, query: event.query));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          errorText: data.error, status: FormStatus.failure, regions: []));
    }
  }

  Future<void> _searchByDistrict(
      SearchDistrictsByNameEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data =
        await placesDatabaseRepository.searchDistrictsByName(event.query);
    List<DistrictModel> datas = data.data;

    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          districts: datas, status: FormStatus.success, query: event.query));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          errorText: data.error, status: FormStatus.failure, districts: []));
    }
  }

  Future<void> _searchByQuarter(
      SearchQuartersByNameEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data =
        await placesDatabaseRepository.searchQuartersByName(event.query);
    List<QuarterModel> datas = data.data;
    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          quarters: datas, status: FormStatus.success, query: event.query));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(
          errorText: data.error, status: FormStatus.failure, quarters: []));
    }
  }

  Future<void> _getSearchHistoryByLimit(
      GetSearchHistoryEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data =
        await searchHistoryRepository.getRecentSearches(event.limit);
    List<SearchHistoryModel> datas = data.data;
    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(history: datas, status: FormStatus.success));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(errorText: data.error, status: FormStatus.failure));
    }
  }

  Future<void> _createSearchHistory(
      CreateSearchHistoryEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data =
        await searchHistoryRepository.insertSearchQuery(event.query);
    var datas = data.data;
    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(status: FormStatus.success));
      add(GetSearchHistoryEvent(15));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(errorText: data.error, status: FormStatus.failure));
    }
  }

  Future<void> _clearSearchHistory(
      ClearSearchHistoryEvent event, Emitter<PlacesState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data = await searchHistoryRepository.clearSearchHistory();
    add(GetSearchHistoryEvent(15));

    String datas = data.data;
    if (datas.isNotEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(status: FormStatus.success, history: []));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(errorText: data.error, status: FormStatus.failure));
    }
  }

  Future<void> _updateQuery(
      UpdateQueryEvent event, Emitter<PlacesState> emitter) async {
    add(SearchRegionsByNameEvent(event.query));
    add(SearchQuartersByNameEvent(event.query));
    add(SearchDistrictsByNameEvent(event.query));
  }
}
