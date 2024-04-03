// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Todo%20Models/fetch_data_model.dart';

class Deadline {
  static Future<void> showMenuFun(BuildContext context) async {
    String deadline = await fetchDeadline(context);
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
      useRootNavigator: true,
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem(
          height: 7,
          labelTextStyle: MaterialStateProperty.all(titleStyle),
          child: Text(deadline),
        ),
      ],
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.ease,
        //reverseCurve: Curves.easeInBack,
      ),
    );
  }

  static Future<String> fetchDeadline(BuildContext context) async {
    try {
      FetchData fetchData = FetchData();
      List<Map<String, dynamic>> userTodos = await fetchData.getUserTodos();

      if (userTodos.isNotEmpty && userTodos[0]['deadline'] != null) {
        return userTodos[0]['deadline'];
      } else {
        return 'No deadline';
      }
    } catch (e) {
      // Handle or log the error as appropriate for your application
      print('Error fetching deadline: $e');
      return 'Error fetching deadline';
    }
  }
}
