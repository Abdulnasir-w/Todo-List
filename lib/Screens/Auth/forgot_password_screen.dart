import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/forgot_model.dart';

import '../../Components/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      title: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                    const SizedBox(
                      height: 40,
                    ),
                    MyCustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await ForgotPassword().resetPassword(
                              emailController.text,
                            );
                            Fluttertoast.showToast(
                                msg:
                                    "Reset Email Has Been Sent Plz check your Email.");
                          } catch (e) {
                            rethrow;
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      title: "FORGOT PASSWORD",
                      color: primaryColor,
                      colorText: textColor,
                      isLoading: isLoading,
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
