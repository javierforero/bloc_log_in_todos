import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            TextField(
              decoration: InputDecoration(labelText: 'EMAIL'),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PASSWORD'),
              obscureText: true,
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
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
