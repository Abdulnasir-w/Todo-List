import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // signIn with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save The Token Locally
      await saveTokenLocally(userCredential.user!.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred during sign in";

      switch (e.code) {
        case 'invalid-credential':
          errorMessage = "Invalid email or password";
          break;
        case 'user-disabled':
          errorMessage = "This account has been disabled";
          break;
        case 'user-not-found':
          errorMessage = "No account found with this email";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Cannot Login Email or Password is Incorrect");
      rethrow;
    }
    // Add a throw statement to ensure a return value
    throw Exception("Sign in failed");
  }

  // Save the authentication token locally
  Future<void> saveTokenLocally(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }
}
