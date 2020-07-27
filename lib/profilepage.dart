import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("welcome to profile page"),
              RaisedButton(
                onPressed: goBack,
                child: Text("Main page"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }
}
