// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Auth/singin_screen.dart';
import 'package:to_do_list/Screens/Screens/home_screen.dart';

class AuthenticationStatus extends StatefulWidget {
  const AuthenticationStatus({super.key});

  @override
  State<AuthenticationStatus> createState() => _AuthenticationStatusState();
}

class _AuthenticationStatusState extends State<AuthenticationStatus> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    setState(() {
      isLoading = false;
    });
    if (isLoggedIn) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: scaffoldbg,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return const SignInScreen();
    }
  }
}
