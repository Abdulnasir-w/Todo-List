import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // SignUp with username, email and password
  Future<UserCredential> signUpWithEmailandPassword(
    String username,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        userCredential.user!.displayName!;
      }

      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get the current user
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  // Get the Current user Token
  Future<String?> getCurrentUserToken() async {}

  // Sign Out
  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }
}
