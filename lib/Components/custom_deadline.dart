// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Todo%20Models/fetch_data_model.dart';

class Deadline {
  static Future<void> showMenuFun(BuildContext context, int taskId) async {
    String? deadline = await FetchData().deadline(taskId.toString());
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );
    await showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: secondryColor,
      useRootNavigator: false,
      context: context,
      position: RelativeRect.fromLTRB(
        // 55, 80, 34, 34,

        position.dx + button.size.height,
        position.dy +
            button
                .size.height, // Adjust the dy value to position below the icon
        overlay.size.width -
            position.dx -
            button.size.width, // Adjust the right edge position
        overlay.size.height -
            position.dy -
            button.size.height, // Adjust the bottom edge position
      ),
      items: [
        PopupMenuItem(
          height: 7,
          labelTextStyle: WidgetStateProperty.all(titleStyle),
          child: Center(child: Text(deadline ?? "No Deadline")),
        ),
      ],
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.ease,
      ),
    );
  }
}
