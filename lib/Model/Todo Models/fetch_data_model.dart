import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/Model/Todo%20Models/todo_model.dart';

class FetchData {
  Future<List<Todo>> fetchData() async {
    List<Todo> todos = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("Todo List").get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        todos.add(Todo.fromFireStore(doc));
      }
      return todos;
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }
}
