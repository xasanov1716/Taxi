import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  SocialAuthBloc() : super(AuthInitial()) {
    on<LoginWithFacebook>(loginWithFacebook);
    on<LoginWithGoogle>(loginWithGoogle);
    on<LoginWithApple>(loginWithApple);
    on<AuthFirstStepSuccessEvent>(firstStep);
    on<AuthSecondStepSuccessEvent>(secondStep);
    on<AuthThirdStepSuccessEvent>(thirdStep);
  }
  final bool response = true;

  firstStep(AuthFirstStepSuccessEvent first,Emitter<SocialAuthState> emit)async{
    emit(AuthFirstStepSuccessState());
  }

   secondStep(AuthSecondStepSuccessEvent first,Emitter<SocialAuthState> emit){
    emit(AuthSecondStepSuccessState());
  }
  thirdStep(AuthThirdStepSuccessEvent first,Emitter<SocialAuthState> emit){
    emit(AuthThirdStepSuccessState());
  }

   loginWithFacebook(LoginWithFacebook productsEvent,Emitter<SocialAuthState> emit) async {
    emit(AuthLoading());
   await Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      emit(AuthSuccess(productsEvent.successText));
    }else if(response == false) {
      emit(const AuthError(errorText: "Facebook orqali kirish xato"));
    }
  }

   loginWithGoogle(LoginWithGoogle productsEvent, Emitter<SocialAuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 4));
    if(response == true) {
      emit(AuthSuccess(productsEvent.successText));
    }else if(response == false) {
      emit(const AuthError(errorText: "Google orqali kirish xato"));
    }
  }

  loginWithApple(LoginWithApple productsEvent, Emitter<SocialAuthState> emit) async {
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
