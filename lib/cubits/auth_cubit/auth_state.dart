part of 'auth_cubit.dart';

 class AuthState extends Equatable {
   const AuthState({ this.password='', this.phoneNumber=''});

   final String phoneNumber;
  final String password;

   AuthState copyWith({
     String? phoneNumber,
     String? password,
 })=> AuthState(password: password ?? this.password,phoneNumber: phoneNumber ?? this.phoneNumber);

   factory AuthState.fromJson(Map<String, dynamic> json) => AuthState(
     password: json["password"] as String? ?? "",
     phoneNumber: json["phoneNumber"] as String? ?? "",
   );

   @override
   String toString() {
     return '''
    Username: $password
    UserAge:$phoneNumber
    ''';
   }

  @override
  List<Object?> get props =>[phoneNumber,password];
}



