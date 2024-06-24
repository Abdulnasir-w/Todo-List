import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Constants/constats.dart';

Future<void> deleteTodoItem(String id) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      CollectionReference<Map<String, dynamic>> userTasks =
          firestore.collection("users").doc(user.uid).collection("Tasks");
      await userTasks.doc(id).delete();
      Fluttertoast.showToast(
        msg: "Successfully Deleted",
        backgroundColor: primaryColor,
        textColor: textColor,
      );
    } else {
      Fluttertoast.showToast(
        msg: "User Not Found",
        backgroundColor: primaryColor,
        textColor: textColor,
      );
    }
  } catch (e) {
    Fluttertoast.showToast(
      msg: "$e",
      backgroundColor: primaryColor,
      textColor: textColor,
    );
  }
}
