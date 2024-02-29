import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    todoList = FetchData().fetchData();
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      Fluttertoast.showToast(msg: "Error while Data Fetching");
                      return Center(
                        child: Text("Error : ${snapshot.hasError}"),
                      );
                    } else {
                      List<DocumentSnapshot>? data = snapshot.data;
                      return ListView.builder(
                        itemCount: data?.length ?? 0,
                        itemBuilder: ((context, index) {
                          Timestamp? timestamp =
                              data![index].get('createdDate') as Timestamp?;
                          String createdDateText = timestamp != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(timestamp.toDate())
                              : 'N/A';

                          return Container(
                            width: 330,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data[index]["title"],
                                        style: GoogleFonts.montserrat(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                        "assets/Icons/clock white.svg",
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data[index]["description"],
                                    style: GoogleFonts.montserrat(
                                        color: textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "Created on: $createdDateText",
                                    style: GoogleFonts.montserrat(
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
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
