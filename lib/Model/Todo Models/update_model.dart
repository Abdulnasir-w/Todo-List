import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateTodo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateTodo(
    int id,
    String? title,
    String? description,
    String? deadline,
    String? image,
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference<Map<String, dynamic>> userTasks =
            firestore.collection('users').doc(user.uid).collection("Tasks");
        await userTasks.doc(id.toString()).update({
          if (title != null) 'title': title,
          if (description != null) 'description': description,
          if (deadline != null) 'deadline': deadline,
          if (image != null) 'image': image,
        });
        Fluttertoast.showToast(msg: "Updated Successfully");
      } else {
        Fluttertoast.showToast(msg: "User not Logged in");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
