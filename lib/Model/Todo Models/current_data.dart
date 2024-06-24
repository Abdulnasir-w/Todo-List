import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Todo%20Models/todo_data_model.dart';

Future<TodoItem?> getCurrentTodoItem(int id) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user != null) {
      final docRef = firestore
          .collection("users")
          .doc(user.uid)
          .collection("Tasks")
          .doc(id.toString());
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        return TodoItem.fromFirestore(docSnapshot);
      } else {
        Fluttertoast.showToast(
          msg: "Todo item not found.",
          backgroundColor: primaryColor,
          textColor: textColor,
        );
      }
    }
  } catch (e) {
    throw Exception(e);
    //Fluttertoast.showToast(msg: "Error fetching todo item: $e");
  }
  return null;
}
