import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());

    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );

      throw Exception("Erro ao logar");

      _changeState(SignUpSuccessState());
      developer.log('Usuário logado');
      return true;
    } catch (e) {
      _changeState(SignUpErrorState());
      return false;
    }
  }
}
