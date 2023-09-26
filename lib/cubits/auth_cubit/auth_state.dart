part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.password = '',
    this.phoneNumber = '',
    this.status = FormStatus.pure,
    this.statusMessage = "",
  });

  final String phoneNumber;
  final String password;
  final FormStatus status;
  final String statusMessage;

  AuthState copyWith({
    String? phoneNumber,
    String? statusMessage,
    String? password,
    FormStatus? status,
  }) =>
      AuthState(
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  String toString() {
    return '''
    Username: $password
    UserAge:$phoneNumber
    Status:$status
    ''';
  }

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        status,
        statusMessage,
      ];
}
