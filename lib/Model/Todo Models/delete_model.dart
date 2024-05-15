import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> deleteTodoItem(String id) async {
  try {
    print("$id");
    await FirebaseFirestore.instance.collection("Tasks").doc(id).delete();

    Fluttertoast.showToast(msg: "Deleted Successfully.");
  } catch (e) {
    throw Exception(e);
  }
}
