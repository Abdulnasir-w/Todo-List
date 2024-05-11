import 'package:flutter/material.dart';

import '../../Utils/delete_and_cancel_button.dart';

class DeleteTodoScreen extends StatelessWidget {
  const DeleteTodoScreen({super.key});

  deleteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return const DeleteAndCancelButton();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
