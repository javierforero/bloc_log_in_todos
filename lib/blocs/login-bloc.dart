import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc_log_in_todos/mixins/validators.dart';
import 'package:bloc_log_in_todos/models/base-bloc.dart';

class LoginBloc extends Object with Validators implements BaseBloc {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // streams to subscribe to
  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator).distinct();

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator).distinct();

  Stream<bool> get submitValid => Observable.combineLatest2(
      emailStream.map<bool>((data) => data != '' ? true : false),
      passwordStream.map<bool>((data) => data != '' ? true : false),
          (bool isEmailValid, bool isPasswordValid) {
        print('checking yooo');
        return isEmailValid && isPasswordValid;
      });

  // getters to send to pipe
  void Function(String) get emailChanged => _emailController.sink.add;

  void Function(String) get passwordChanged => _passwordController.sink.add;


  void submit() {
    print(_emailController.value);
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
