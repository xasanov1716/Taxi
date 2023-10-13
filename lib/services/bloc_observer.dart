import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/blocs/location_bloc/location_bloc.dart';

class MyCustomObserver extends BlocObserver {
  MyCustomObserver._();

  static final instance = MyCustomObserver._();

  factory MyCustomObserver() {
    return instance;
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("BLOC_ON_CREATE");
    if(bloc is LocationBloc){

    }
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("BLOC_ON_EVENT: ${bloc.runtimeType} AND ${event}");
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(
        "BLOC_ON_STATE: ${bloc.runtimeType} CURRENT: ${change.currentState} NEXT: ${change.nextState}");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("BLOC_ON_CLOSe");
    super.onClose(bloc);
  }
}
