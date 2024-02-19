import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Screens/add_todo_screen.dart';
import 'package:to_do_list/Screens/Screens/profile_screen.dart';
import 'package:to_do_list/Utils/custom_popmenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/Icons/list icon.svg"),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "LIST OF TODO",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 36, color: secondryColor),
                  ),
                ),
                const SizedBox(
                  width: 141,
                ), // Add Spacer to push CustomPopMenuButton to the end
                const CustomPopMenuButton(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoScreen(),
            ),
          );
        },
        icon: SvgPicture.asset("assets/Icons/plus-circle.svg"),
      ),
    );
  }
}
