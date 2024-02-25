import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      await saveTokenLocaly(userCredential.user!.uid);
      await userCredential.user?.updateDisplayName(username);

      return userCredential;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get the save authentication Token
  Future<void> saveTokenLocaly(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userToken", token);
  }

  // Get the save authentication Token
  Future<String?> getSavedToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userToken");
  }

  // Get the Current User Token
  Future<String?> getCurrentUserToken() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return await user.getIdToken();
    }
    return null;
  }

  // Sign Out
  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    return firebaseAuth.signOut();
  }
}
