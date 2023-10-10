import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/user/user_field_keys.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/data/repositories/user_repository.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UsersState> {
  final UserRepo userRepo;

  UserBloc({required this.userRepo})
      : super(UsersState(
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
            role: '',
            password: "",
          ),
          status: FormStatus.pure,
        )) {
    on<UserEvent>((event, emit) {});
    on<AddUserEvent>(addUser);
    on<UpdateUserEvent>(updateUser);
    on<DeleteUserEvent>(deleteUser);
    on<UpdateCurrentUserEvent>(updateCurrentUserField);
  }

  Future<void> addUser(AddUserEvent addUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText:tr('loading'), status: FormStatus.loading));
    await userRepo.addUser(userModel: state.userModel);
    debugPrint('added');
    emit(state.copyWith(status: FormStatus.success, statusText: tr('user_added_succesfull')));
  }

  Future<void> updateUser(UpdateUserEvent updateUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText: tr('loading'), status: FormStatus.loading));
    await userRepo.updateUser(userModel: state.userModel);
    emit(state.copyWith(
      status: FormStatus.success,
      statusText:tr('user_update_succesfull'),
    ));
  }

  Future<void> deleteUser(DeleteUserEvent deleteUserEvent, Emitter<UsersState> emit) async {
    emit(state.copyWith(statusText:tr('loading'), status: FormStatus.loading));
    await userRepo.deleteUser(userId: deleteUserEvent.userId);
    emit(state.copyWith(status: FormStatus.success, statusText:tr('user_deleted_succesfull')));
  }

  void clearData(DeleteUserEvent deleteUserEvent, Emitter<UsersState> emit) {
    emit(
      UsersState(
        userModel: UserModel(
            image: '',
            password: "",
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

  Future<void> getUserByDocId() async {
    final userId = StorageRepository.getString(StorageKeys.userId);
    final docRef = FirebaseFirestore.instance
        .collection(
            FirebaseCollections.users) // Assuming the collection name is "users" for clients
        .doc(userId);

    final data = await docRef.get();

    if (data.exists) {
      final userModel = UserModel.fromJson(data.data() as Map<String, dynamic>);
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(userModel: userModel));
      StorageRepository.putString(StorageKeys.userRole, AppConstants.client);
    } else {
      debugPrint(
          "Documnet does not exist ---------------------------------------------------------------------");
      // throw Exception("User document does not exist for userId: $userId");
    }
  }

  clearUserModelState() {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(
      userModel: UserModel(
          password: "",
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
    ));
  }

  String canRequest() {
    return state.canRequest();
  }

  updateCurrentUserField(UpdateCurrentUserEvent updateCurrentUserEvent, Emitter<UsersState> emit) {
    UserModel currentUser = state.userModel;

    switch (updateCurrentUserEvent.fieldKey) {
      case UserFieldKeys.fullName:
        {
          currentUser = currentUser.copyWith(fullName: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.image:
        {
          currentUser = currentUser.copyWith(image: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.gender:
        {
          currentUser = currentUser.copyWith(gender: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.phone:
        {
          currentUser = currentUser.copyWith(phone: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.emailAddress:
        {
          currentUser = currentUser.copyWith(emailAddress: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.birthDate:
        {
          currentUser = currentUser.copyWith(birthDate: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.addressText:
        {
          currentUser = currentUser.copyWith(addressText: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.fcmToken:
        {
          currentUser = currentUser.copyWith(fcmToken: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.userId:
        {
          currentUser = currentUser.copyWith(userId: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.createdAt:
        {
          currentUser = currentUser.copyWith(createdAt: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.nickName:
        {
          currentUser = currentUser.copyWith(nickName: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.role:
        {
          currentUser = currentUser.copyWith(role: updateCurrentUserEvent.value as String);
          break;
        }
      case UserFieldKeys.password:
        {
          currentUser = currentUser.copyWith(password: updateCurrentUserEvent.value as String);
          break;
        }
    }

    debugPrint("USER BLOC: $currentUser");
    currentUser = currentUser.copyWith(role: StorageRepository.getString(StorageKeys.userRole));
    emit(state.copyWith(userModel: currentUser));
  }
}
