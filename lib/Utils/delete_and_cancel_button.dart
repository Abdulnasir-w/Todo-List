// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/Model/Todo%20Models/delete_model.dart';
import '../Components/custom_button.dart';
import '../Constants/constats.dart';

class DeleteAndCancelButton extends StatefulWidget {
  final int id;
  const DeleteAndCancelButton({super.key, required this.id});

  @override
  State<DeleteAndCancelButton> createState() => _DeleteAndCancelButtonState();
}

class _DeleteAndCancelButtonState extends State<DeleteAndCancelButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            MyCustomButton(
              key: UniqueKey(),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await deleteTodoItem(widget.id.toString());
                  Navigator.pop(context);
                } catch (e) {
                  Navigator.pop(context);
                  throw Exception(e);
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              title: "DELETE TODO",
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
              title: "CANCEL",
              color: textColor,
              colorText: const Color(0xff00FF19),
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
