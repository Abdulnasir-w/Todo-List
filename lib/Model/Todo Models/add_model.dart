import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTodo {
  CollectionReference todo = FirebaseFirestore.instance.collection("Todo List");

  void addTodo(String title, String description, selectedDate, selectedImage) {
    // Define the data to be added
    Map<String, dynamic> todoData = {
      'title': title,
      'decription': description,
      'deadline': selectedDate,
      'image': selectedImage,
    };
    todo
        .add(todoData)
        .then(
          (value) => Fluttertoast.showToast(msg: "Added Successfully"),
        )
        .onError((error, stackTrace) => Fluttertoast.showToast(
              msg: error.toString(),
            ));
  }
}
