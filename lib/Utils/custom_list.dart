import "package:flutter/material.dart";
import "package:to_do_list/Constants/constats.dart";
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
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.hasError}"),
          );
        } else {
          List<Map<String, dynamic>> userTodos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: userTodos.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> todo = userTodos[index];
              return Container(
                width: 327,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Card(
                  color: secondryColor,
                ),
              );
            },
          );
        }
      },
    );
  }
}
