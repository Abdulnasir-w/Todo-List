import 'package:flutter/material.dart';
import 'package:to_do_list/Constants/constats.dart';

import '../../Utils/edit_and_update_todo.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  void editBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: primaryColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        builder: (context) {
          return const EditAndUpdateTodo();
        });
  }
}
