import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'code_input_state.dart';

class CodeInputCubit extends Cubit<CodeInputState> {
  late Timer _countdownTimer;
  final List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());
  int remainingTime = 60;

  CodeInputCubit() : super(CodeInputInitial()){
    startCountdown();
  }

  void startCountdown() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        emit(CodeInputCountdown(remainingTime));
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {

    remainingTime = 60;
    emit(CodeInputCountdown(remainingTime));
    startCountdown();
  }

  @override
  Future<void> close() {
    _countdownTimer.cancel();
    return super.close();
  }

  void disposeControllersAndFocusNodes() {
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
  }

  void handleCodeInput(int index, String value) {
    if (value.isEmpty) {
      pinControllers[index].clear();
      if (index > 0) {
        FocusScope.of(_context!).requestFocus(pinFocusNodes[index - 1]);
      }
    } else {
      if (index == 3) {
        pinFocusNodes[index].unfocus();
      } else {
        FocusScope.of(_context!).requestFocus(pinFocusNodes[(index + 1) % 4]);
      }
    }
  }

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }
}
