import 'package:flutter/material.dart';
import 'package:to_do_list/Components/adding_textfield.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Utils/row_suffixicon.dart';

import '../../Components/custom_button.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
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
                  const AddingTextField(
                    width: 500,
                    height: 55,
                    title: 'Title',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AddingTextField(
                    width: 500,
                    height: 400,
                    title: 'Description',
                    lines: 50,
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
