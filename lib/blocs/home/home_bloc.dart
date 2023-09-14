import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeEvent>((event, emit) {
    });
  }
}
