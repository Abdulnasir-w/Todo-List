import 'package:flutter/material.dart';
import 'package:to_do_list/Components/adding_textfield.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Utils/row_suffixicon.dart';

import '../../Components/custom_button.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({super.key});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: const DetailsScreenAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 37),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  AddingTextField(
                    title: 'Title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a Title";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AddingTextField(
                    title: 'Description',
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
                    title: 'Deadline (Optional)',
                    asset: "assets/Icons/calendar.svg",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyRowSuffix(
                    title: 'Add Image (Optional)',
                    asset: "assets/Icons/image.svg",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MyCustomButton(
                    onPressed: () {},
                    title: "EDIT TODO",
                    color: Colors.white,
                    colorText: primaryColor,
                    isLoading: isLoading,
                    indicatorColor: primaryColor,
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
