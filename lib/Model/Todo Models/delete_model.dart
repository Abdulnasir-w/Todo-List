import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> deleteTodoItem(String id) async {
  try {
    DocumentReference reference =
        FirebaseFirestore.instance.collection("todo").doc(id);
    await reference.delete();
    Fluttertoast.showToast(msg: "Deleted Successfully.");
  } catch (e) {
    throw Exception(e);
  }
}
