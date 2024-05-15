import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> deleteTodoItem(id) async {
  try {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(id.toString())
        .delete();

    Fluttertoast.showToast(msg: "Deleted Successfully.");
  } catch (e) {
    throw Exception(e);
  }
}
