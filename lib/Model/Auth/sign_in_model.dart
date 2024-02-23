import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn {
  static void signIn(String emailController, String passwordController) {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController, password: passwordController);
    } catch (e) {
      print("this is the errror of signIn model :$e ");
    }
  }
}
