// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/sign_in_model.dart';
import 'package:to_do_list/Screens/Auth/sigup_screen.dart';
import 'package:to_do_list/Screens/Screens/home_screen.dart';

import '../../Components/custom_textfield.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      body: PopScope(
        canPop: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    height: 150,
                  ),
                  Column(
                    children: [
                      MyCustomTextField(
                        title: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyCustomTextField(
                        title: "Password",
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassField: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
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
                        height: 30,
                      ),
                      MyCustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              SignIn signIn = SignIn();
                              await signIn.signInWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                              );
                              Fluttertoast.showToast(msg: "Login Successfully");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            } catch (e) {
                              rethrow;
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                        title: "SIGN IN",
                        color: primaryColor,
                        colorText: textColor,
                        isLoading: isLoading,
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
                                          const SignUpScreen()));
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
      ),
    );
  }
}
