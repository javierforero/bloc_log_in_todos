import 'package:bloc_log_in_todos/pages/home-page.dart';
import 'package:bloc_log_in_todos/pages/login-page.dart';
import 'package:bloc_log_in_todos/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final login = LoginPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Login/Todo',
      theme: ThemeData().copyWith(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        disabledColor: Colors.grey,
        dialogBackgroundColor: Color.fromRGBO(35, 35, 35, 0.73),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        LoginAppRoutes.home: (context) {
          return HomePage();
        },
        LoginAppRoutes.login: (context) {
          return login;
        }
      },
    );
  }
}
