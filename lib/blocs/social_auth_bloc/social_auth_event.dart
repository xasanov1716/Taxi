part of 'social_auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}


class LoginWithFacebook extends AuthEvent{
  final String successText= 'Authentication success for Facebook';
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithGoogle extends AuthEvent{
  final String successText= 'Authentication success for Google';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithApple extends AuthEvent{
  final String successText= 'Authentication success for Apple';
  @override
  List<Object?> get props => throw UnimplementedError();
}