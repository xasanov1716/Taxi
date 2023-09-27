import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_app/cubits/user/user_state.dart';

import '../../data/models/user/user_field_keys.dart';
import '../../data/models/user/user_model.dart';


class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
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
            role: ''
             ),
            errorText: "",
          ),
        );


  updateCurrentUserField({
    required UserFieldKeys fieldKey,
    required dynamic value,
  }) {
    UserModel currentUser = state.userModel;

    switch (fieldKey) { 
      case UserFieldKeys.fullName:
        {
          currentUser = currentUser.copyWith(fullName: value as String);
          break;
        }
      case UserFieldKeys.image:
        {
          currentUser = currentUser.copyWith(image: value as String);
          break;
        }
      case UserFieldKeys.gender:
        {
          currentUser = currentUser.copyWith(gender: value as String);
          break;
        }
      case UserFieldKeys.phone:
        {
          currentUser = currentUser.copyWith(phone: value as String);
          break;
        }
      case UserFieldKeys.emailAddress:
        {
          currentUser = currentUser.copyWith(emailAddress: value as String);
          break;
        }
      case UserFieldKeys.birthDate:
        {
          currentUser = currentUser.copyWith(birthDate: value as String);
          break;
        }
      case UserFieldKeys.addressText:
        {
          currentUser = currentUser.copyWith(addressText: value as String);
          break;
        }
      case UserFieldKeys.fcmToken:
        {
          currentUser = currentUser.copyWith(fcmToken: value as String);
          break;
        }
      case UserFieldKeys.userId:
        {
          currentUser = currentUser.copyWith(userId: value as String);
          break;
        }
      case UserFieldKeys.createdAt:
        {
          currentUser = currentUser.copyWith(createdAt: value as String);
          break;
        }
      case UserFieldKeys.nickName:
        {
          currentUser = currentUser.copyWith(nickName: value as String);
          break;
        }
        case UserFieldKeys.role:
        {
          currentUser = currentUser.copyWith(role: value as String);
          break;
        }
    }

    debugPrint("USER: ${currentUser.toString()}");

    emit(state.copyWith(userModel: currentUser));
  }

  bool canRegister() {
    UserModel currentUser = state.userModel;
    if (currentUser.phone.length < 9) {
      return false;
    }

    if (currentUser.image.isEmpty) {
      return false;
    }

    if (currentUser.createdAt.isEmpty) {
      return false;
    }

    if (currentUser.fcmToken.isEmpty) {
      return false;
    }

    if (currentUser.addressText.isEmpty) {
      return false;
    }

    if (currentUser.userId.isEmpty) {
      return false;
    }

    if (currentUser.fullName.isEmpty) {
      return false;
    }

    if (currentUser.emailAddress.isEmpty) {
      return false;
    }
    if (currentUser.gender.isEmpty) {
      return false;
    }

    if (currentUser.birthDate.isEmpty) {
      return false;
    }
     if (currentUser.nickName.isEmpty) {
      return false;
    }
    return true;
  }

  clearData() {
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
            role: '',
             ),
        errorText: "",
      ),
    );
  }
}
