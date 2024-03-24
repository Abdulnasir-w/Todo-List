import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String title;
  final String description;
  final DateTime createdDate;
  final String? image;
  final String? deadline;
  Todo({
    required this.title,
    required this.description,
    required this.createdDate,
    this.image,
    this.deadline,
  });
  factory Todo.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Todo(
      title: data['title'],
      description: data['description'],
      createdDate: data['createdDate'],
      image: data['image'],
      deadline: data['deadline'],
    );
  }
  Map<String, dynamic> toFireStore() {
    return {
      "title": title,
      "description": description,
      "createdDate": createdDate,
      "image": image,
      "deadline": deadline,
    };
  }
}
