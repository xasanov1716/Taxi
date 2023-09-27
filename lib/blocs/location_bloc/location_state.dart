part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}
class LocationLoadingState extends LocationState {}
class LocationErrorState extends LocationState {
  final String errorText;
  LocationErrorState({required this.errorText});
}
class LocationSuccessState extends LocationState{}

