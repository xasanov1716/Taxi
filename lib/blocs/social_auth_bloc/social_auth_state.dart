part of 'social_auth_bloc.dart';

abstract class SocialAuthState extends Equatable {
  const SocialAuthState();
}

class AuthInitial extends SocialAuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends SocialAuthState{

  @override
  List<Object> get props => [];
}

class AuthSuccess extends SocialAuthState {
  final String successText;
 const  AuthSuccess(this.successText);

  @override
  List<Object> get props => [];
}

class AuthError extends SocialAuthState {
 const AuthError({this.errorText=''});
  final String errorText;
  @override
  List<Object> get props => [errorText];
}

class AuthFirstStepSuccessState extends SocialAuthState{
  @override
  List<Object> get props=>[];
}

class AuthSecondStepSuccessState extends SocialAuthState{
  @override
  List<Object> get props=>[];
}
class AuthThirdStepSuccessState extends SocialAuthState{
  @override
  List<Object> get props=>[];
}

