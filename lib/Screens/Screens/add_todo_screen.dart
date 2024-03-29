// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/Components/adding_textfield.dart';
import 'package:to_do_list/Components/custom_appbar.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import '../../Model/Todo Models/add_model.dart';
import '../../Utils/row_suffixicon.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedDate;
  String? selectedImage;

  // for date
  void updateSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  // for image
  void updateSelectedImage(String image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: const CustomAppbar(),
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
                    MyRowSuffix(
                      title: 'Deadline (Optional)',
                      asset: "assets/Icons/calendar.svg",
                      onDateSelected: updateSelectedDate,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyRowSuffix(
                      title: 'Add Image (Optional)',
                      asset: "assets/Icons/image.svg",
                      onImageSelected: updateSelectedImage,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyCustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await AddTodo().addTodo(
                              titleController.text,
                              descriptionController.text,
                              selectedDate,
                              selectedImage,
                              DateTime.now(),
                            );
                            Navigator.pop(context);
                          } catch (e) {
                            throw Exception(e);
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      title: "ADD TODO",
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
      ),
    );
  }
}
