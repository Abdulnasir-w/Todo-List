import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo {
  final CollectionReference<Map<String, dynamic>> todo =
      FirebaseFirestore.instance.collection("Todo List".toString());
  int id = 1;
  Future<void> addTodo(
    String title,
    String description,
    deadline,
    image,
  ) async {
    try {
      // Get the current number of documents in the collection
      QuerySnapshot<Map<String, dynamic>> snapshot = await todo.get();
      int nextId = snapshot.size + 1;

      // Add the todo to Firestore with the custom ID
      await todo.doc(nextId.toString()).set({
        'id': nextId,
        'title': title,
        'description': description,
        'deadline': deadline,
        'image': image,
        // Other fields...
      });
    } catch (e) {
      print('Error adding todo: $e');
    }
  }
  // void addTodo(String title, String description, selectedDate, selectedImage) {
  //   // Define the data to be added
  //   Map<String, dynamic> todoData = {
  //     'id': id,
  //     'title': title,
  //     'decription': description,
  //     'deadline': selectedDate,
  //     'image': selectedImage,
  //   };

  //   todo.doc(title).set(todoData).then((value) {
  //     Fluttertoast.showToast(msg: 'Added Successfully');
  //     id++;
  //   }).catchError(
  //       // ignore: invalid_return_type_for_catch_error
  //       (error) => Fluttertoast.showToast(msg: 'Failed to add todo: $error'));
  // }
}
