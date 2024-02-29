import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/sign_up_model.dart';
import 'package:to_do_list/Screens/Auth/singin_screen.dart';
import 'package:to_do_list/Screens/Screens/home_screen.dart';
import 'package:to_do_list/Utils/custom_pop.dart';

import '../../Components/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        } else {
          Pop.showBackDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: scaffoldbg,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Center(
                      child: SvgPicture.asset(
                    "assets/Logo/Login Pic.svg",
                    width: 187,
                    height: 180,
                  )),
                  const SizedBox(
                    height: 80,
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
                        height: 17,
                      ),
                      MyCustomTextField(
                        title: 'Full Name',
                        keyboardType: TextInputType.emailAddress,
                        controller: userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 17,
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
                      const SizedBox(
                        height: 17,
                      ),
                      MyCustomTextField(
                        title: "Congirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        isPassField: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Confirm Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MyCustomButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              try {
                                await SignUp().signUpWithEmailandPassword(
                                  userNameController.text,
                                  emailController.text,
                                  passwordController.text,
                                );
                                Fluttertoast.showToast(
                                    msg: "Account Created Successfully");
                                Navigator.push(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const HomeScreen()),
                                  ),
                                );
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: "Cannot Create Account . Sorry!");
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Password is not Matching.");
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                        title: "SIGN UP",
                        color: primaryColor,
                        colorText: textColor,
                        isLoading: isLoading,
                        indicatorColor: textColor,
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
      ),
    );
  }
}
