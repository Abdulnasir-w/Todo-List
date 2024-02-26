import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(e);
    }
  }
}
