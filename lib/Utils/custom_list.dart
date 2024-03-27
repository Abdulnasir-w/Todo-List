import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";
import "package:to_do_list/Constants/constats.dart";
import "package:to_do_list/Model/Todo%20Models/fetch_data_model.dart";

class ListOfCards extends StatelessWidget {
  const ListOfCards({super.key});

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData.getUserTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.hasError}"),
            );
          } else {
            List<Map<String, dynamic>> userTodos = snapshot.data ?? [];
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userTodos.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> todo = userTodos[index];
                DateTime createdDate = todo['createdDate'].toDate();
                String formattedDate =
                    DateFormat.yMMMd().add_jm().format(createdDate);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: 327,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                todo['title'],
                                style: titleStyle,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/Icons/clock white.svg",
                                  width: 16,
                                  height: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Flexible(
                            child: Text(
                              todo['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: descriptionStyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Created at $formattedDate",
                            style: dateStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
