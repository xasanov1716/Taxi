part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class GetLocationEvent extends LocationEvent{}

class UpdateLocationEvent extends LocationEvent{
  final LatLng newLatLng;
  UpdateLocationEvent({required this.newLatLng});
}