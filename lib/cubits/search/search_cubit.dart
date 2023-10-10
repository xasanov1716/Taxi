import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<String>> {
  List<String> list = [
    tr('what_is_taxio'),
    tr('how_to_use_taxio'),
    tr('how_do_cancel_taxi'),
    tr('is_taxi_free'),
    tr('how_do_add_promo'),
    tr('why_didnot_my_payment'),
    tr('why_are_service_price_difference'),
    tr('why_didnot_after_payment'),
  ];

  SearchCubit()
      : super([
          tr('what_is_taxio'),
          tr('how_to_use_taxio'),
          tr('how_do_cancel_taxi'),
          tr('is_taxi_free'),
          tr('how_do_add_promo'),
          tr('why_didnot_my_payment'),
          tr('why_are_service_price_difference'),
          tr('why_cannot_new_payment'),
          tr('why_didnot_after_payment'),
        ]);

  void search(String query) {
    final results = list
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(results);
  }
}
