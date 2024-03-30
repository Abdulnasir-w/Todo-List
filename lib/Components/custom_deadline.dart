import 'package:flutter/material.dart';
import 'package:to_do_list/Constants/constats.dart';

class Deadline {
  static Future<void> showMenuFun(
      BuildContext context, Map<String, dynamic> todo) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem(
          height: 17,
          labelTextStyle: MaterialStateProperty.all(titleStyle),
          child: todo['deadline'] != null
              ? Text(
                  todo['deadline'],
                )
              : const Text('No Deadline'),
        ),
      ],
    );
  }
}
