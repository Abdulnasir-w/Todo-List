import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  Future<List<DocumentSnapshot>> fetchData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Todo List").get();
    return snapshot.docs;
  }
}
