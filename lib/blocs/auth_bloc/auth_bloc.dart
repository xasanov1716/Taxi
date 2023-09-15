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


   loginWithFacebook(AuthEvent productsEvent,Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      emit(AuthSuccess());
    }else if(response == false) {
      emit(const AuthError(errorText: "handling error for loginWithFacebook"));
    }
  }

   loginWithGoogle(AuthEvent productsEvent, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if(response == true) {
      emit(AuthSuccess());
    }else if(response == false) {
      emit(const AuthError(errorText: "handling error for loginWithGoogle"));
    }
  }

  loginWithApple(AuthEvent productsEvent, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Future.delayed(const Duration(seconds: 3));
    if(response == true) {
      Future.delayed(const Duration(seconds: 3));
      emit(AuthSuccess());
    }else if(response == false) {
      emit(const AuthError(errorText: "handling error for loginWithApple"));
    }
  }
}
