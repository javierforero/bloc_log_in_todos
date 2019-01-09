import 'package:bloc_log_in_todos/blocs/login-bloc.dart';
import 'package:bloc_log_in_todos/widgets/loading-dialog.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  void onLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 112.0,
                  maxWidth: 142.0,
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 55.0,
                        height: 55.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 5.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();

    if (loginBloc.isSaving) {
      print('hiiii im in view');
    }

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF244DFF), Color(0xFF2CBEFF)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Padding(
          padding: EdgeInsets.only(top: 55.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Log in',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                      decorationColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              StreamBuilder<String>(
                stream: loginBloc.emailStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) =>
                        TextField(
                          onChanged: loginBloc.emailChanged,
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            errorText: snapshot.error,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 26.0,
                          ),
                        ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: loginBloc.passwordStream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) =>
                        TextField(
                          onChanged: loginBloc.passwordChanged,
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            errorText: snapshot.error,
                          ),
                          obscureText: true,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 26.0,
                          ),
                        ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder<bool>(
                        stream: loginBloc.submitValid,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          return FlatButton(
                            padding: EdgeInsets.all(18.0),
                            disabledColor: Colors.grey,
                            color: Theme.of(context).primaryColor,
                            onPressed: snapshot.hasData
                                ? () {
                                    onLoading(context);
                                    loginBloc.submit().then((value) {
                                      // hide spinner on true
                                      Navigator.of(context).pop();
                                    });
                                  }
                                : null,
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
