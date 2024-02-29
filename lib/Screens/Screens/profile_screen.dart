// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_appbar.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/sign_up_model.dart';
import 'package:to_do_list/Screens/Auth/singin_screen.dart';
import 'package:to_do_list/Utils/name_email_changepassword.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            SvgPicture.asset(
              "assets/Logo/Profile screen.svg",
              width: 350,
              height: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            const NameAndEmailDetails(),
            const SizedBox(
              height: 50,
            ),
            MyCustomButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await Future.delayed(
                    const Duration(
                      seconds: 3,
                    ),
                  );
                  await SignUp().signOut();
                  Fluttertoast.showToast(msg: "Log Out Successfully ");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                } catch (e) {
                  throw Exception(e);
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              title: "LOG OUT",
              color: primaryColor,
              colorText: textColor,
              isLoading: isLoading,
              indicatorColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
