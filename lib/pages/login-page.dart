import 'package:bloc_log_in_todos/blocs/login-bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: Container(),
          elevation: 0.0,
          iconTheme: null,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height - 870.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Log in',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            StreamBuilder<String>(
              stream: loginBloc.email,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  TextField(
                    onChanged: loginBloc.emailChanged(snapshot.data),
                    decoration: InputDecoration(labelText: 'EMAIL'),
                  ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<String>(
              stream: loginBloc.password,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  TextField(
                    onChanged: loginBloc.passwordChanged(snapshot.data),
                    decoration: InputDecoration(labelText: 'PASSWORD'),
                    obscureText: true,
                  ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<bool>(
                    stream: loginBloc.submitCheck,
                    builder: (BuildContext context, AsyncSnapshot snapshot) =>
                        FlatButton(
                          padding: EdgeInsets.all(18.0),
                          disabledColor: Colors.grey,
                          color: Theme.of(context).primaryColor,
                          onPressed: snapshot.hasData
                              ? () => loginBloc.submit(snapshot)
                              : null,
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
