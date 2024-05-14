import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/Model/Todo%20Models/todo_data_model.dart';

Future<TodoItem?> getCurrentTodoItem(int id) async {
  return await FirebaseFirestore.instance
      .collection("todo")
      .doc(id.toString())
      .get()
      .then((doc) {
    if (doc.exists) {
      return TodoItem.fromMap(doc.data() ?? <String, dynamic>{});
    } else {
      return null;
    }
  });
}
