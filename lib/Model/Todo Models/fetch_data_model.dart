import 'package:cloud_firestore/cloud_firestore.dart';

class FetchData {
  Future<List<DocumentSnapshot>> fetchData() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("Todo List").get();
      return snapshot.docs;
    } catch (e) {
      print("Error fetching data: $e");
      throw e;
    }
  }
}
