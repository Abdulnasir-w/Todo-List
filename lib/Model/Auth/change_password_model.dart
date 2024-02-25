import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> passwordChange(String password) async {
    User? user = firebaseAuth.currentUser;
    try {
      await user?.updatePassword(password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
