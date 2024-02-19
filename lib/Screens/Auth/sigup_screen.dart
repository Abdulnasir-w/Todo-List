import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Auth/singin_screen.dart';

import '../../Components/custom_textfield.dart';

class SignUnScreen extends StatelessWidget {
  const SignUnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: scaffoldbg,
      body: PopScope(
        canPop: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Center(
                    child: SvgPicture.asset(
                  "assets/Logo/Login Pic.svg",
                  width: 187,
                  height: 180,
                )),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    MyCustomTextField(
                      title: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCustomTextField(
                      title: 'Full Name',
                      keyboardType: TextInputType.emailAddress,
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCustomTextField(
                      title: "Password",
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyCustomTextField(
                      title: "Congirm Password",
                      keyboardType: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      isPassField: true,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    MyCustomButton(
                      onPressed: () {},
                      title: "SIGN UP",
                      color: primaryColor,
                      colorText: textColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: primaryStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
                          },
                          child: Text(
                            "Sign In",
                            style: txtBtnColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
