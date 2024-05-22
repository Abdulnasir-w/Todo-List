import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateTodoItemInFirebase(int id, String title, String description,
    String? deadline, String? image) async {
  final docRef =
      FirebaseFirestore.instance.collection('todos').doc(id.toString());
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
