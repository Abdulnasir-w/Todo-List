import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FetchData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getUserTodos() async {
    List<Map<String, dynamic>> userTodos = [];
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference<Map<String, dynamic>> userTasks =
            firestore.collection("users").doc(user.uid).collection("Tasks");
        QuerySnapshot<Map<String, dynamic>> snapshot = await userTasks.get();
        userTodos = snapshot.docs.map((doc) => doc.data()).toList();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Loading Error");
    }
    return userTodos;
  }
}
