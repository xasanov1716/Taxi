part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}


class LoginWithFacebook extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithGoogle extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithApple extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}