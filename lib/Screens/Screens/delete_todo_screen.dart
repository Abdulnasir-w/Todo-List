import 'package:flutter/material.dart';

import '../../Utils/delete_and_cancel_button.dart';

class DeleteTodoScreen extends StatelessWidget {
  final String id;
  const DeleteTodoScreen({super.key, required this.id});

  void deleteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DeleteAndCancelButton(
            id: id,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
