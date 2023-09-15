part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState{

  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final String successText;
 const  AuthSuccess(this.successText);

  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
 const AuthError({this.errorText=''});
  final String errorText;
  @override
  List<Object> get props => [errorText];
}

