import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:to_do_list/Components/custom_button.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Auth/reset_code_model.dart';

class CodeScreen extends StatefulWidget {
  // final String email;
  final String newPassword;
  const CodeScreen({
    super.key,
    //required this.email,
    required this.newPassword,
  });

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController codeController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldbg,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCodeTextField(
                appContext: context,
                length: 6,
                keyboardType: TextInputType.number,
                textStyle: GoogleFonts.montserrat(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                controller: codeController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 65,
                  fieldWidth: 45,
                  borderRadius: BorderRadius.circular(12),
                  activeColor: primaryColor,
                  inactiveColor: Colors.grey,
                  selectedColor: secondryColor,
                ),
              ),
              MyCustomButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    ResetCode()
                        .resetPassword(widget.newPassword, codeController.text);
                    Fluttertoast.showToast(msg: "Password Reset Successfull.");
                  } catch (e) {
                    throw Exception(e);
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                title: 'VERIFY',
                color: primaryColor,
                colorText: textColor,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
