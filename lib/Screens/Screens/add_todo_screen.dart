import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/Components/adding_textfield.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Screens/profile_screen.dart';
import '../../../Components/row_suffixicon.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            "assets/Logo/banner.svg",
            width: 84,
            height: 19,
          ),
        ),
        leadingWidth: 160,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 190.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: SvgPicture.asset(
              "assets/Icons/settings.svg",
              width: 50,
              height: 24,
            ),
          ),
        ),
      ),
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
                    title: "ADD TODO",
                    color: Colors.white,
                    colorText: primaryColor,
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
