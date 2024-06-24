import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/Screens/Screens/delete_todo_screen.dart';
import 'package:to_do_list/Screens/Screens/edit_todo_screen.dart';

import 'custom_deadline.dart';

class DetailsScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final int taskId;
  const DetailsScreenAppbar({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      title: Padding(
        padding: const EdgeInsets.only(
          left: 220.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Deadline.showMenuFun(context, taskId);
              },
              child: SvgPicture.asset(
                "assets/Icons/clock.svg",
                width: 50,
                height: 24,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                EditTodoScreen(
                  todoId: taskId,
                ).editBottomSheet(context);
              },
              child: SvgPicture.asset(
                "assets/Icons/edit.svg",
                width: 50,
                height: 24,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                DeleteTodoScreen(
                  id: taskId,
                ).deleteBottomSheet(context);
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
