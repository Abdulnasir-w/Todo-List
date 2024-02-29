import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/change_password_model.dart';

import '../../Components/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            if (passwordController.toString() ==
                                confirmPasswordController.toString()) {
                              try {
                                await ChangePassword()
                                    .passwordChange(passwordController.text);
                                Fluttertoast.showToast(
                                    msg: "Password Change Scuccessfully");
                              } catch (e) {
                                throw Exception(e);
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } else {
                              await Future.delayed(
                                const Duration(seconds: 2),
                              );
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "Password Doesn't Match");
                            }
                          }
                        },
                        title: "CHANGE PASSWORD",
                        color: primaryColor,
                        colorText: textColor,
                        isLoading: isLoading,
                        indicatorColor: textColor,
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
