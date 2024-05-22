import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateTodoItemInFirebase(int id, String title, String description,
    String? deadline, String? image) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      final docRef = firestore
          .collection("users")
          .doc(user.uid)
          .collection("Tasks")
          .doc(id.toString());
      DocumentSnapshot snapshot = await docRef.get();
      if (!snapshot.exists) {
        throw Exception("No document to update");
      }
      await docRef.update({
        'title': title,
        'description': description,
        'deadline': deadline,
        'image': image,
      });
    }
  } catch (e) {
    throw Exception(e);
  }
}
