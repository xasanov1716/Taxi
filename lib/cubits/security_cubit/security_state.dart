part of 'security_cubit.dart';

class SecurityState extends Equatable {
  final List<String> securityNames;
  final List<bool> securityValues;

  const SecurityState({
    required this.securityNames,
    required this.securityValues,
  });

  SecurityState copyWith({
    List<String>? securityNames,
    List<bool>? securityValues,
  }) {
    return SecurityState(
      securityNames: securityNames ?? this.securityNames,
      securityValues: securityValues ?? this.securityValues,
    );
  }

  @override
  List<Object?> get props => [securityNames, securityValues];
}
