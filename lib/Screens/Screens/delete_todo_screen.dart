import 'package:flutter/material.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';

class DeleteTodoScreen extends StatefulWidget {
  const DeleteTodoScreen({super.key});

  @override
  State<DeleteTodoScreen> createState() => _DeleteTodoScreenState();
}

class _DeleteTodoScreenState extends State<DeleteTodoScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: deleteBottomSheet(context),
    );
  }

  deleteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 400,
            child: Column(
              children: [
                MyCustomButton(
                  onPressed: () {},
                  title: "Delete TODO",
                  color: textColor,
                  colorText: secondryColor,
                  isLoading: isLoading,
                  indicatorColor: secondryColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyCustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Cancel",
                  color: textColor,
                  colorText: const Color(0xff00FF19),
                ),
              ],
            ),
          );
        });
  }
}
