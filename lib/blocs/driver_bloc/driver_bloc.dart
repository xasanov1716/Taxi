import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/driver/driver_fields.dart';
import 'package:taxi_app/data/models/driver/driver_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/repositories/driver_repos.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

part 'driver_event.dart';
part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  final DriverRepo driverRepo;

  DriverBloc({required this.driverRepo})
      : super(
          DriverState(
            drivers: const [],
            status: FormStatus.pure,
            driversById: const [],
            statusText: '',
            driverModel: DriverModel(
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
            ),
          ),
        ) {
    on<AddDriverEvent>(addDriver);
    on<UpdateDriverEvent>(updateDriver);
    on<DeleteDriverEvent>(deleteDriver);
    getDriverByDocId();
  }

  Future<void> addDriver(
      AddDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.addDriver(driverModel: state.driverModel);

    emit(state.copyWith(status: FormStatus.success));
  }

  Future<void> updateDriver(
      UpdateDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.updateDriver(driverModel: state.driverModel);

    emit(state.copyWith(status: FormStatus.success));
  }

  Future<void> deleteDriver(
      DeleteDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.deleteDriver(driverId: event.driverId);

    emit(state.copyWith(status: FormStatus.success));
  }

  Future<void> getDriverByDocId() async {
    final userId = StorageRepository.getString(StorageKeys.userId);
    final docRef = FirebaseFirestore.instance
        .collection(FirebaseCollections.drivers)
        .doc(userId);

    final data = await docRef.get();

    if (data.exists) {
      final driverModel =
      DriverModel.fromJson(data.data() as Map<String, dynamic>);
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(driverModel: driverModel));
      StorageRepository.putString(StorageKeys.userRole, "driver");
    } else {

      debugPrint("Documnet does not exist ---------------------------------------------------------------------");

    }
  }


  clearDriverState(){
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(driverModel: DriverModel(
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
    )));
  }


  void updateDriverField({
    required DriverFieldKeys fieldKey,
    required dynamic value,
  }) {
    DriverModel currentDriver = state.driverModel;

    switch (fieldKey) {
      case DriverFieldKeys.role:
        {
          currentDriver = currentDriver.copyWith(role: value as String);
          break;
        }
      case DriverFieldKeys.driverId:
        {
          currentDriver = currentDriver.copyWith(driverId: value as String);
          break;
        }
      case DriverFieldKeys.fcmToken:
        {
          currentDriver = currentDriver.copyWith(fcmToken: value as String);
          break;
        }
      case DriverFieldKeys.fullName:
        {
          currentDriver = currentDriver.copyWith(fullName: value as String);
          break;
        }
      case DriverFieldKeys.createdAt:
        {
          currentDriver = currentDriver.copyWith(createdAt: value as String);
          break;
        }
      case DriverFieldKeys.birthDate:
        {
          currentDriver = currentDriver.copyWith(birthDate: value as String);
          break;
        }
      case DriverFieldKeys.phoneNumber:
        {
          currentDriver = currentDriver.copyWith(phoneNumber: value as String);
          break;
        }
      case DriverFieldKeys.telegramLink:
        {
          currentDriver = currentDriver.copyWith(telegramLink: value as String);
          break;
        }
      case DriverFieldKeys.email:
        {
          currentDriver = currentDriver.copyWith(email: value as String);
          break;
        }
      case DriverFieldKeys.gender:
        {
          currentDriver = currentDriver.copyWith(gender: value as String);
          break;
        }
      case DriverFieldKeys.imageUrl:
        {
          currentDriver = currentDriver.copyWith(imageUrl: value as String);
          break;
        }
      case DriverFieldKeys.currentLocation:
        {
          currentDriver =
              currentDriver.copyWith(currentLocation: value as String);
          break;
        }
      case DriverFieldKeys.fromToText:
        {
          currentDriver = currentDriver.copyWith(fromToText: value as String);
          break;
        }
      case DriverFieldKeys.from:
        {
          currentDriver = currentDriver.copyWith(from: value as int);
          break;
        }
      case DriverFieldKeys.to:
        {
          currentDriver = currentDriver.copyWith(to: value as int);
          break;
        }
      case DriverFieldKeys.emptyPlaces:
        {
          currentDriver = currentDriver.copyWith(emptyPlaces: value as int);
          break;
        }
      case DriverFieldKeys.aboutDriver:
        {
          currentDriver = currentDriver.copyWith(aboutDriver: value as String);
          break;
        }
      case DriverFieldKeys.carModel:
        {
          currentDriver = currentDriver.copyWith(carModel: value as String);
          break;
        }
      case DriverFieldKeys.passengerType:
        {
          currentDriver =
              currentDriver.copyWith(passengerType: value as String);
          break;
        }
      case DriverFieldKeys.price:
        {
          currentDriver = currentDriver.copyWith(price: value as int);
          break;
        }
      case DriverFieldKeys.hasDelivery:
        {
          currentDriver = currentDriver.copyWith(hasDelivery: value as bool);
          break;
        }
      case DriverFieldKeys.hasRoofTop:
        {
          currentDriver = currentDriver.copyWith(hasRoofTop: value as bool);
          break;
        }
      case DriverFieldKeys.isOnline:
        {
          currentDriver = currentDriver.copyWith(isOnline: value as bool);
          break;
        }
      case DriverFieldKeys.lastOnlineTime:
        {
          currentDriver =
              currentDriver.copyWith(lastOnlineTime: value as String);
          break;
        }
      case DriverFieldKeys.longitude:
        {
          currentDriver = currentDriver.copyWith(longitude: value as double);
          break;
        }
      case DriverFieldKeys.latitude:
        {
          currentDriver = currentDriver.copyWith(latitude: value as double);
          break;
        }
      case DriverFieldKeys.hasFilled:
        {
          currentDriver = currentDriver.copyWith(hasFilled: value as bool);
          break;
        }
      case DriverFieldKeys.carNumber:
        {
          currentDriver = currentDriver.copyWith(carNumber: value as String);
          break;
        }
    }

    debugPrint("DRIVER: ${currentDriver.toString()}");
    currentDriver = currentDriver.copyWith(
        role: StorageRepository.getString(StorageKeys.userRole));
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(driverModel: currentDriver));
  }
}
