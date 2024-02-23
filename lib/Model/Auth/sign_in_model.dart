import 'package:firebase_auth/firebase_auth.dart';
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
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Cannot Login Email or Password is Incorrect");
      rethrow;
    }
  }

  // Save the authentication token locally
  Future<void> saveTokenLocally(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }
}
