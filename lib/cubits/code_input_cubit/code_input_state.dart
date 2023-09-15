part of 'code_input_cubit.dart';

abstract class CodeInputState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CodeInputInitial extends CodeInputState {}

class CodeInputCountdown extends CodeInputState {
  final int remainingTime;

  CodeInputCountdown(this.remainingTime);

  @override
  List<Object?> get props => [remainingTime];
}
