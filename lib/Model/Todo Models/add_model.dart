import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo {
  final CollectionReference<Map<String, dynamic>> todo =
      FirebaseFirestore.instance.collection("Todo List");
  int id = 1;
  // By ID
  Future<void> addTodo(
    String title,
    String description,
    String? deadline, // Assuming deadline is of type DateTime
    String? image,
    DateTime createdDate, // Add createdDate field
  ) async {
    try {
      // Add the todo to Firestore with Firestore-generated ID
      QuerySnapshot<Map<String, dynamic>> snapshot = await todo.get();
      int nextId = snapshot.size + 1;
      await todo.doc(nextId.toString()).set({
        'id': nextId,
        'title': title,
        'description': description,
        'deadline': deadline,
        'image': image,
        'createdDate': createdDate,

        // Add createdDate field
        // Other fields...
      });

      Fluttertoast.showToast(msg: "Added Successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Cannot Add. Please Try Again");
    }
  }
}


  // By document name is title
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

