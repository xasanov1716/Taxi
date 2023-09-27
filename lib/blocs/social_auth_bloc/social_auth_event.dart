part of 'social_auth_bloc.dart';

abstract class SocialAuthEvent extends Equatable {
  const SocialAuthEvent();
}

class LoginWithFacebook extends SocialAuthEvent {
  final String successText = 'Authentication success for Facebook';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithGoogle extends SocialAuthEvent {
  final String successText = 'Authentication success for Google';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginWithApple extends SocialAuthEvent {
  final String successText = 'Authentication success for Apple';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthFirstStepSuccessEvent extends SocialAuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSecondStepSuccessEvent extends SocialAuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthThirdStepSuccessEvent extends SocialAuthEvent {
  @override
  List<Object?> get props => [];
}
