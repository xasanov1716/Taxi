import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<String>> {
  List<String> list = [
    'What is Taxio?',
    'How to use Taxio?',
    'How do I cancel a taxi booking?',
    'Is Taxio free to use?',
    'How to add promo on Taxio?',
    'Why did my payment did’nt working?',
    'Why are the taxi service prices different?',
    'Why I can\'t add a new payment method?',
    'Why didn\'t I get the e-receipt after payment?',
  ];

  SearchCubit()
      : super([
          'What is Taxio?',
          'How to use Taxio?',
          'How do I cancel a taxi booking?',
          'Is Taxio free to use?',
          'How to add promo on Taxio?',
          'Why did my payment did’nt working?',
          'Why are the taxi service prices different?',
          'Why I can\'t add a new payment method?',
          'Why didn\'t I get the e-receipt after payment?',
        ]);

  void search(String query) {
    final results = list
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(results);
  }
}
