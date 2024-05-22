import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> deleteTodoItem(String id) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      CollectionReference<Map<String, dynamic>> userTasks =
          firestore.collection("users").doc(user.uid).collection("Tasks");
      await userTasks.doc(id).delete();
      Fluttertoast.showToast(msg: "Successfully Deleted");
    } else {
      Fluttertoast.showToast(msg: "User Not Found");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "$e");
  }
}
