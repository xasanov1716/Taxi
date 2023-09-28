import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/data/repositories/user_repository.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;

  UserBloc({required this.userRepo})
      : super(UserState(
          statusText: '',
          userModel: UserModel(
              image: '',
              fullName: '',
              nickName: '',
              emailAddress: '',
              birthDate: '',
              phone: '',
              addressText: '',
              createdAt: '',
              fcmToken: '',
              userId: '',
              gender: '',
              role: ''),
          status: FormStatus.pure,
        )) {
    on<UserEvent>((event, emit) {});
    on<AddUserEvent>(addUser);
    on<UpdateUserEvent>(updateUser);
    on<DeleteUserEvent>(deleteUser);
    on<UpdateCurrentUserEvent>(updateCurrentUserField);
  }

  Future<void> addUser(
      AddUserEvent addUserEvent, Emitter<UserState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await userRepo.addUser(userModel: state.userModel);
    debugPrint('added');
    emit(state.copyWith(
        status: FormStatus.success, statusText: "User added successfully"));
  }

  Future<void> updateUser(
      UpdateUserEvent updateUserEvent, Emitter<UserState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await userRepo.updateUser(userModel: updateUserEvent.userModel);
    emit(state.copyWith(
        status: FormStatus.success, statusText: "User updated successfully"));
  }

  Future<void> deleteUser(
      DeleteUserEvent deleteUserEvent, Emitter<UserState> emit) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await userRepo.deleteUser(userId: deleteUserEvent.userId);
    emit(state.copyWith(
        status: FormStatus.success, statusText: "User deleted successfully"));
  }

  void clearData(DeleteUserEvent deleteUserEvent, Emitter<UserState> emit) {
    emit(
      UserState(
        userModel: UserModel(
            image: '',
            fullName: '',
            nickName: '',
            emailAddress: '',
            birthDate: '',
            phone: '',
            gender: '',
            addressText: '',
            createdAt: '',
            fcmToken: '',
            userId: '',
            role: ''),
        statusText: "",
        status: FormStatus.unauthenticated,
      ),
    );
  }

  updateUserModel(UserModel user) {
    emit(state.copyWith(userModel: user));
  }

  String canRequest() {
    return state.canRequest();
  }

  updateCurrentUserField(
      UpdateCurrentUserEvent updateCurrentUserEvent, Emitter<UserState> emit) {
    UserModel currentUser = state.userModel;

    switch (updateCurrentUserEvent.fieldKey) {
      case UserFieldKeys.fullName:
        {
          currentUser = currentUser.copyWith(
              fullName: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.image:
        {
          currentUser = currentUser.copyWith(
              image: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.gender:
        {
          currentUser = currentUser.copyWith(
              gender: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.phone:
        {
          currentUser = currentUser.copyWith(
              phone: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.emailAddress:
        {
          currentUser = currentUser.copyWith(
              emailAddress: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.birthDate:
        {
          currentUser = currentUser.copyWith(
              birthDate: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.addressText:
        {
          currentUser = currentUser.copyWith(
              addressText: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.fcmToken:
        {
          currentUser = currentUser.copyWith(
              fcmToken: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.userId:
        {
          currentUser = currentUser.copyWith(
              userId: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.createdAt:
        {
          currentUser = currentUser.copyWith(
              createdAt: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.nickName:
        {
          currentUser = currentUser.copyWith(
              nickName: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.role:
        {
          currentUser = currentUser.copyWith(
              role: updateCurrentUserEvent.value as String);
          break;
        }
    }

    currentUser = currentUser.copyWith(
        role: StorageRepository.getString(StorageKeys.userRole));
    debugPrint("USER BLOC: ${currentUser.toString()}");

    emit(state.copyWith(userModel: currentUser));
  }
}
