class TodoItem {
  final String id;
  final String title;
  final String deadline;
  final String image;

  TodoItem(
      {required this.id,
      required this.title,
      required this.deadline,
      required this.image});
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
        id: map['id'],
        title: map['title'],
        deadline: map['deadline'],
        image: map['image']);
  }
}
