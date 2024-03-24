import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> addTodo(
    String title,
    String description,
    String? deadline, // Assuming deadline is of type DateTime
    String? image,
    DateTime createdDate, // Add createdDate field
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference<Map<String, dynamic>> userTasks =
            firestore.collection("users").doc(user.uid).collection("Tasks");
        QuerySnapshot<Map<String, dynamic>> snapshot = await userTasks.get();
        int nextId = snapshot.size + 1;
        await userTasks.doc(nextId.toString()).set({
          'id': nextId,
          'title': title,
          'description': description,
          'deadline': deadline,
          'image': image,
          'createdDate': createdDate,
        });
        Fluttertoast.showToast(msg: "Added Successfully");
      } else {
        Fluttertoast.showToast(msg: "User not logged in");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Cannot Add. Please Try Again");
    }
  }
}
