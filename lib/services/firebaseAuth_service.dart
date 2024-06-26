import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
//creating new account
  static Future<String> createAccountWithEmail(
      String email, String password) async {
           log("Signup Tapped");
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created";
              

      // return user;
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
            // log("Signup Tapped");

  }

  //Logging In with Email and password
  static Future<String> loginWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Logged";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

// for logging user out
  static Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
// checking user is logged in or not

  static Future<bool> isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null; // returns boolean value true if user is logged in
  }
}
