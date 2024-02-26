import 'package:firebase_auth/firebase_auth.dart';

class ResetCode {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void resetPassword(String newPassword, String code) async {
    try {
      await firebaseAuth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } catch (e) {
      throw Exception(e);
    }
  }
}
