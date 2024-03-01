import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/Model/Todo%20Models/todo_model.dart';

class FetchData {
  Future<List<Todo>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Todo List").get();
      List<Todo> todos = querySnapshot.docs.map((doc) {
        return Todo.fromFireStore(doc.data() as Map<String, dynamic>);
      }).toList();
      return todos;
    } catch (e) {
      print("Error fetching data: $e");
      throw e;
    }
  }
}
