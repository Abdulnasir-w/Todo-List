import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String title;
  String description;
  DateTime createdDate;
  String image;
  String deadline;
  Todo({
    required this.title,
    required this.description,
    required this.createdDate,
    required this.image,
    required this.deadline,
  });
  factory Todo.fromFireStore(Map<String, dynamic> data) {
    Timestamp timestamp = data["ceatedDate"] ?? Timestamp.now();
    return Todo(
        title: data['title'],
        description: data['description'],
        createdDate: timestamp.toDate(),
        image: data['image'],
        deadline: data['deadline']);
  }
}
