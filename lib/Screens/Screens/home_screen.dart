import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Components/custom_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Todo%20Models/fetch_data_model.dart';
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
  late Future<List<DocumentSnapshot>> todoList;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    setState(() {
      todoList = FetchData().fetchData();
      isLoading = false;
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
        body: Padding(
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
              const SizedBox(
                height: 20,
              ),
              // Data from FireStore
              Expanded(
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: todoList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.hasError}"),
                      );
                    } else {
                      final todos = snapshot.data;
                      return ListView.builder(
                        itemCount: todos!.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return ListTile(
                            title: Text(
                              todo['title'],
                            ),
                            subtitle: Text(
                              todo['description'],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
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
      ),
    );
  }
}
