import "package:flutter/material.dart";
import "package:to_do_list/Model/Todo%20Models/fetch_data_model.dart";

class ListOfCards extends StatelessWidget {
  const ListOfCards({super.key});

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData.getUserTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (){}
        });
  }
}
