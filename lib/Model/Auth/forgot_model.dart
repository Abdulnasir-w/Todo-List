import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> resetPassword(String email, String newPassword) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Forgot error : $e");
      throw Exception(e);
    }
  }
}
