import 'package:flutter_bloc/flutter_bloc.dart';

class HelpCenterCategoryCubit extends Cubit<String> {
  HelpCenterCategoryCubit() : super('General');

  void selectCategory(String category) {
    emit(category);
  }
}
