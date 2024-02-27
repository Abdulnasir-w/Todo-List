import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Components/custom_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Screens/Screens/add_todo_screen.dart';
import 'package:to_do_list/Utils/custom_pop.dart';
import 'package:to_do_list/Utils/custom_popmenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

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
        appBar: const CustomAppbar(),
        body: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Custom tab bar,
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
                        ), 
                        const CustomPopMenuButton(),
                      ],
                    ),
                    //
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
      ),
    );
  }
}
