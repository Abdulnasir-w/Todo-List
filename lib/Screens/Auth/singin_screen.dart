import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Auth/sigup_screen.dart';
import 'package:to_do_list/Screens/Screens/home_screen.dart';

import '../../Components/custom_textfield.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: scaffoldbg,
      body: PopScope(
        canPop: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 150,
                ),
                Column(
                  children: [
                    MyCustomTextField(
                      title: 'Login',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: primaryStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyCustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      title: "SIGN IN",
                      color: primaryColor,
                      colorText: textColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: primaryStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUnScreen()));
                          },
                          child: Text(
                            "Sign Up",
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
