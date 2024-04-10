import 'package:flutter/material.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';

class DetailsToDoScreen extends StatelessWidget {
  final int taskId;
  final Map<String, dynamic> todo;
  const DetailsToDoScreen(
      {super.key, required this.taskId, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: DetailsScreenAppbar(
        taskId: taskId,
      ),
    );
  }
}
