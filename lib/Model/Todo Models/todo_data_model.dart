class TodoItem {
  final String id;
  final String title;
  final String description;
  final String deadline;
  final String image;

  TodoItem(
      {required this.id,
      required this.description,
      required this.title,
      required this.deadline,
      required this.image});
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        deadline: map['deadline'],
        image: map['image']);
  }
}
