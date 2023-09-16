import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginWithFacebook>(loginWithFacebook);
    on<LoginWithGoogle>(loginWithGoogle);
    on<LoginWithApple>(loginWithApple);
  }
  final bool response = true;


   loginWithFacebook(LoginWithFacebook productsEvent,Emitter<AuthState> emit) async {
    emit(AuthLoading());
   await Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      emit(AuthSuccess(productsEvent.successText));
    }else if(response == false) {
      emit(const AuthError(errorText: "Facebook orqali kirish xato"));
    }
  }

   loginWithGoogle(LoginWithGoogle productsEvent, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      emit(AuthSuccess(productsEvent.successText));
    }else if(response == false) {
      emit(const AuthError(errorText: "Google orqali kirish xato"));
    }
  }

  loginWithApple(LoginWithApple productsEvent, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      Future.delayed(const Duration(seconds: 3));
      emit(AuthSuccess(productsEvent.successText));
    }else if(response == false) {
      emit(const AuthError(errorText: "Apple orqali kirish xato"));
    }
  }
}
