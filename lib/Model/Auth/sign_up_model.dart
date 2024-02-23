import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp {
  static void signUp(emailController, String passwordController,
      String userNameController) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
      await userCredential.user?.sendEmailVerification();
      Fluttertoast.showToast(msg: "Account is Created successfully");
      await userCredential.user?.reload();
    } catch (e) {
      Fluttertoast.showToast(msg: "Account Cannot Created !");
      throw Exception(e);
    }
  }
}
