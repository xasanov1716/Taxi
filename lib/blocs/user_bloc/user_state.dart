part of 'user_bloc.dart';

class UserState extends Equatable {
  final String statusText;
  final UserModel userModel;
  final FormStatus status;

  const UserState({
    required this.statusText,
    required this.userModel,
    required this.status,
  });
  
  UserState copyWith({
    String? statusText,
    UserModel? userModel,
    FormStatus? status,
  }) {
    return UserState(
        statusText: statusText ?? this.statusText,
        userModel: userModel ?? this.userModel,
        status: status ?? this.status);
  }

 String canRequest(){
   if(userModel.fullName.isEmpty)return 'Full name';
   if(userModel.nickName.isEmpty)return 'Nick name';
   if(userModel.birthDate.isEmpty)return 'Birth date';
   if(userModel.phone.isEmpty)return 'Phone number';
   if(userModel.gender.isEmpty)return 'Gender';
   if(userModel.addressText.isEmpty)return 'Address';
   return '';
  }

  @override
  List<Object?> get props => [statusText, status, userModel];
}
