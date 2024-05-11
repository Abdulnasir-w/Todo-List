import 'package:flutter/material.dart';
import 'package:to_do_list/Components/adding_textfield.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Utils/row_suffixicon.dart';

import '../Constants/constats.dart';

class EditAndUpdateTodo extends StatefulWidget {
  final int id;
  const EditAndUpdateTodo({super.key, required this.id});

  @override
  State<EditAndUpdateTodo> createState() => _EditAndUpdateTodoState();
}

class _EditAndUpdateTodoState extends State<EditAndUpdateTodo> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 730,
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AddingTextField(
                    title: 'Title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Write a Title";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AddingTextField(
                    title: 'Description',
                    controller: descriptionController,
                    lines: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Write a Description";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyRowSuffix(
                    title: "Deadline (Optional)",
                    asset: "assets/Icons/calendar.svg",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const MyRowSuffix(
                    title: "Image (Optional)",
                    asset: "assets/Icons/image.svg",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyCustomButton(
                    onPressed: () {},
                    title: "UPDATE",
                    color: textColor,
                    colorText: primaryColor,
                    isLoading: isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
