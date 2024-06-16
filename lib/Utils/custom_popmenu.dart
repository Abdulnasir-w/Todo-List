import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/Constants/constats.dart';

class CustomPopMenuButton extends StatefulWidget {
  const CustomPopMenuButton({super.key});

  @override
  State<CustomPopMenuButton> createState() => _CustomPopMenuButtonState();
}

class _CustomPopMenuButtonState extends State<CustomPopMenuButton> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      surfaceTintColor: textColor,
      initialValue: "All",
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onSelected: (value) {
        setState(() {
          selectedItem = value;
        });
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "All",
          onTap: () {},
          child: Text(
            "All",
            style:
                selectedItem == "All" ? menuTextStyleSecondry : menuTextStyle,
          ),
        ),
        PopupMenuItem(
          value: "By Time",
          child: Text(
            "By Time",
            style: selectedItem == "By Time"
                ? menuTextStyleSecondry
                : menuTextStyle,
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          value: "Deadline",
          onTap: () {},
          child: Text(
            "Deadline",
            style: selectedItem == "Deadline"
                ? menuTextStyleSecondry
                : menuTextStyle,
          ),
        ),
      ],
      child: SvgPicture.asset(
        "assets/Icons/filter.svg",
        width: 24,
        height: 24,
      ),
    );
  }
}
