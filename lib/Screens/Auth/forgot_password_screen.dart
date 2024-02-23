import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';

import '../../Components/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: scaffoldbg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 180,
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/Logo/Login Pic.svg",
                width: 187,
                height: 180,
              )),
              const SizedBox(
                height: 250,
              ),
              Column(
                children: [
                  MyCustomTextField(
                    title: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyCustomTextField(
                    title: "Confirm Password",
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyCustomButton(
                    onPressed: () {},
                    title: "CHANGE PASSWORD",
                    color: primaryColor,
                    colorText: textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
