import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Screens/profile_screen.dart';

class DetailsToDoScreen extends StatelessWidget {
  const DetailsToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SvgPicture.asset(
            "assets/Logo/banner.svg",
            width: 84,
            height: 19,
          ),
        ),
        leadingWidth: 160,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 190.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: SvgPicture.asset(
              "assets/Icons/settings.svg",
              width: 50,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
