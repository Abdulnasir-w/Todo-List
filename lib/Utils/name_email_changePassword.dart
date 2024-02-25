import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Auth/forgot_password_screen.dart';

class NameAndEmailDetails extends StatefulWidget {
  const NameAndEmailDetails({super.key});

  @override
  State<NameAndEmailDetails> createState() => _NameAndEmailDetailsState();
}

class _NameAndEmailDetailsState extends State<NameAndEmailDetails> {
  String? name;
  String? email;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // Method to get the Current User Details
  Future<void> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Future.delayed(const Duration(seconds: 4));
      setState(() {
        name = user.displayName;
        email = user.email;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            )
          : Column(
              children: [
                // Name Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Full Name",
                      style: primaryStyle,
                    ),
                    Text(
                      name ?? "Loading...",
                      style: nameStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Email Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                      style: primaryStyle,
                    ),
                    Text(
                      email ?? "Loading...",
                      style: nameStyle,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password",
                      style: primaryStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                      child: Text(
                        "Change Password",
                        style: nameStyle,
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
