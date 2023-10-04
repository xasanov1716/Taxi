part of 'driver_bloc.dart';

// ignore: must_be_immutable
class DriverState extends Equatable {
  final List<DriverModel> drivers;
  final DriverModel driverModel;
  List<DriverModel> driversById;
  final String statusText;

  final FormStatus status;

  DriverState(
      {required this.drivers,
      required this.statusText,
      required this.driverModel,
      required this.status,
      required this.driversById});

  DriverState copyWith({
    FormStatus? status,
    DriverModel? driverModel,
    String? statusText,
    List<DriverModel>? drivers,
    List<DriverModel>? driversById,
  }) {
    return DriverState(
      status: status ?? this.status,
      driversById: driversById ?? this.driversById,
      drivers: drivers ?? this.drivers,
      statusText: statusText ?? this.statusText,
      driverModel: driverModel ?? this.driverModel,
    );
  }

  String canRegister1() {
    if (driverModel.fullName.isEmpty) return 'Full Name';
    if (driverModel.birthDate.isEmpty) return 'Date of birth';
    if (driverModel.phoneNumber.isEmpty) return 'Phone number';
    if (driverModel.gender.isEmpty) return 'Gender';
    if (driverModel.aboutDriver.isEmpty) return 'About driver';
    if (driverModel.carNumber.isEmpty) return 'Car number';
    if (driverModel.telegramLink.isEmpty) return 'Telegram link';
    return '';
  }

  String canRegister2() {
    if (driverModel.price == 0) return 'Price';
    if (driverModel.passengerType.isEmpty) return 'Passenger type';
    if (driverModel.carModel.isEmpty) return 'Car model';
    if (driverModel.emptyPlaces == 0) return 'Empty places';
    return '';
  }

  clear() {
    DriverModel(
      password: "",
      role: '',
      driverId: '',
      fcmToken: '',
      fullName: '',
      createdAt: '',
      birthDate: '',
      phoneNumber: '',
      telegramLink: '',
      email: '',
      gender: '',
      imageUrl: '',
      currentLocation: '',
      fromToText: '',
      from: 0,
      to: 0,
      emptyPlaces: 0,
      aboutDriver: '',
      carModel: '',
      passengerType: '',
      price: 0,
      hasDelivery: false,
      hasRoofTop: false,
      isOnline: false,
      lastOnlineTime: '',
      longitude: 0,
      latitude: 0,
      hasFilled: false,
      carNumber: '',
    );
  }

  @override
  List<Object?> get props => [driversById, status, driverModel, statusText];
}
