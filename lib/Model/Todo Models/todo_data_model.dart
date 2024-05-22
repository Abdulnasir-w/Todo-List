import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItem {
  final String title;
  final String description;
  final String? deadline;
  final String? image;

  TodoItem(
      {required this.description,
      required this.title,
      required this.deadline,
      required this.image});
  factory TodoItem.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    String title = data['title'] ?? '';
    String description = data['description'] ?? '';
    String? deadline = data['deadline'];
    String? image = data['image'];
    return TodoItem(
      title: title,
      description: description,
      deadline: deadline,
      image: image,
    );
  }
}
