import 'package:flutter/material.dart';
import 'package:lawnmanagementv2/hooks/handlers.dart';

void main() {
  runApp(appLogin());
}

class appLogin extends StatefulWidget {
  appLogin({Key key}) : super(key: key);
  @override
  _appLoginState createState() => _appLoginState();
}

class _appLoginState extends State<appLogin> {
  int counter = 1;
  String emailID, password;
  GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    //print("entered build method");
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[900],
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                key: _formKey,
                onSaved: (value) {
                  emailID = value;
                  counter += 1;
                  //print("onsaved event: $counter");
                },
              ),
              Text(
                "hello world : $counter",
                style: TextStyle(color: Colors.white),
              ),
              RaisedButton(
                child: Text("forward"),
                onPressed: () {
                  //  print("forward pressed");
                  _formKey.currentState.save();
                  setState(() {});
                },
              ),
              RaisedButton(
                onPressed: () {
                  login(context);
                },
                child: Text("Login"),
              ),
              RaisedButton(
                onPressed: register,
                child: Text("sign up"),
              ),
              RaisedButton(
                onPressed: reset,
                child: Text("Reset Password"),
              )
            ],
          )),
        ),
      ),
    );
  }
}

/*class BuildContainer extends StatelessWidget {
  const BuildContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "hello world",
              style: TextStyle(color: Colors.white),
            ),
            RaisedButton(
              onPressed: login,
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: register,
              child: Text("sign up"),
            ),
            RaisedButton(
              onPressed: reset,
              child: Text("Reset Password"),
            )
          ],
        )),
      ),
    );
  }
}
*/
