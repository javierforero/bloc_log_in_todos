import 'package:bloc_log_in_todos/models/base-bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // getters to send to pipe
  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  // streams to subscribe to
  Stream<String> get email => _emailController.stream;

  Stream<String> get password => _passwordController.stream;

  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (myEmail, myPassword) => true);

  void submit(snap) {
    print(_emailController.value);
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
