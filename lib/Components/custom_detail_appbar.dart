import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/Components/custom_deadline.dart';
import 'package:to_do_list/Screens/Screens/delete_todo_screen.dart';
import 'package:to_do_list/Screens/Screens/edit_todo_screen.dart';

class DetailsScreenAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  const DetailsScreenAppbar({super.key});

  @override
  State<DetailsScreenAppbar> createState() => _DetailsScreenAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DetailsScreenAppbarState extends State<DetailsScreenAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          left: 130.0,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Deadline.showMenuFun(context);
                },
                child: SvgPicture.asset(
                  "assets/Icons/clock.svg",
                  width: 50,
                  height: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditTodoScreen()),
                  );
                },
                child: SvgPicture.asset(
                  "assets/Icons/edit.svg",
                  width: 50,
                  height: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteTodoScreen()),
                  );
                },
                child: SvgPicture.asset(
                  "assets/Icons/trash.svg",
                  width: 50,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
