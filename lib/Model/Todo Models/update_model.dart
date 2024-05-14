import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateTodoItemInFirebase(
    int id, String title, String description) async {
  await FirebaseFirestore.instance
      .collection("todos")
      .doc(id.toString())
      .update({
    'title': title,
    'description': description,
  });
}
