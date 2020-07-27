import 'package:firebase_auth/firebase_auth.dart';

class LoginResult {
  String message, status, code;
  FirebaseUser user;
}

class AuthManager {
  FirebaseUser user;
  FirebaseAuth _instance;

  AuthManager() {
    this._instance = FirebaseAuth.instance;
  }

  getUser() {
    return user;
  }

  getInstance() {
    return this._instance;
  }

  register({String imEmail, String imPassword}) async {
    LoginResult lresult = new LoginResult();
    try {
      AuthResult result = await (_instance.createUserWithEmailAndPassword(
          email: imEmail, password: imPassword));
      this.user = result.user;
      lresult = verifyEmail(user);
    } catch (e) {
      lresult.status = "E";
      lresult.message = e.message;
      lresult.code = e.code;
    }
    return lresult;
  }

  login({String imEmail, String imPassword}) async {
    LoginResult lresult = new LoginResult();
    try {
      AuthResult result = await (_instance.signInWithEmailAndPassword(
          email: imEmail, password: imPassword));
      // check if email is already verified
      this.user = result.user;
      if (user.isEmailVerified) {
        lresult.message = 'Logged in successfully';
        lresult.status = 'S';
        lresult.user = result.user;
      } else {
        // ask user to verify email first.
        lresult = verifyEmail(user);
      }
    } catch (e) {
      lresult.message = e.message;
      lresult.status = 'E';
      lresult.code = e.code;
    }
    return lresult;
  }

// method to send email verification
  LoginResult verifyEmail(FirebaseUser user) {
    LoginResult lresult = new LoginResult();

    // send email verification
    try {
      user.sendEmailVerification();
      lresult.status = "V";
      lresult.message =
          "Verification email sent to registered email id. Please verify email id and login again.";
    } catch (e) {
      lresult.status = "E";
      lresult.message = "Error while sending verification email: " + e.message;
      lresult.code = e.code;
    }
    return lresult;
  }

// reset password.
  resetPassword({String imEmail}) async {
    LoginResult lresult = new LoginResult();
    try {
      await _instance.sendPasswordResetEmail(email: imEmail);
      lresult.status = "S";
      lresult.message = "Password reset email sent. Please follow instruction";
    } catch (e) {
      lresult.status = "E";
      lresult.message = "Error while password reset" + e.message;
      lresult.code = e.code;
    }
    return lresult;
  }
}
