import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:lawnmanagementv2/authentication.dart';

void login(BuildContext context) {
  print(" welcome to login method");
  //debugger();

  AuthManager authManager = new AuthManager();

  String lEmail = 'saikumarvarada@gmail.com';
  String lPassword = '8584135793';

  authManager.login(imEmail: lEmail, imPassword: lPassword).then((value) {
    print("status: " + value.status);
    print("Message:" + value.message);

    //FirebaseUser user = authManager.getUser();
    FirebaseAuth instance = authManager.getInstance();
    instance.onAuthStateChanged.listen((event) {
      print("onAuthStateChanged triggered");

      // var nextPage = new profilepage();

      /*Navigator.push(
          context, MaterialPageRoute(builder: (context) => profilepage()));*/
    });

    //print("code: " + value.code);

    //debugger();
  });
}

void register() {
  print("welcome to register");

  AuthManager authManager = new AuthManager();
  String lEmail = 'registerrtesting@gmail.com';
  String lPassword = '8584135793';
  authManager.register(imEmail: lEmail, imPassword: lPassword).then((value) {
    print("register message: " + value.message);
    print("register status: " + value.status);
  });
}

void reset() {
  AuthManager authManager = new AuthManager();
  String lEmail = 'saikumarvarada@gmail.com';
  authManager.resetPassword(imEmail: lEmail).then((value) {
    print("reset message: " + value.message);
    print("reset status: " + value.status);
  });
}
