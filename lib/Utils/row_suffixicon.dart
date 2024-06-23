// ignore_for_file: library_private_types_in_public_api, unnecessary_this, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:image_picker/image_picker.dart';
import 'dart:core';

class MyRowSuffix extends StatefulWidget {
  final String title;
  final String asset;
  final Function(String)? onImageSelected;
  final Function(String)? onDateSelected;
  final Function(String)? imageName;
  final String? initialValue;

  const MyRowSuffix({
    super.key,
    required this.title,
    required this.asset,
    this.onDateSelected,
    this.onImageSelected,
    this.imageName,
    this.initialValue,
  });

  @override
  _MyRowSuffixState createState() => _MyRowSuffixState();
}

class _MyRowSuffixState extends State<MyRowSuffix> {
  String? dateSelect = "";
  String imageName = "";
  String? displayText;

  @override
  void initState() {
    super.initState();
    displayText = widget.initialValue != null
        ? widget.initialValue!.split('/').last
        : widget.title;
  }

  @override
  void didUpdateWidget(covariant MyRowSuffix oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        displayText = widget.initialValue != null
            ? widget.initialValue!.split('/').last
            : widget.title;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: textColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayText!,
              style: addHintStyle,
            ),
            GestureDetector(
                onTap: () {
                  if (widget.asset == "assets/Icons/image.svg") {
                    _imagePicker();
                  } else if (widget.asset == "assets/Icons/calendar.svg") {
                    _showCalendarPopup(context);
                  }
                },
                child: SvgPicture.asset(widget.asset)),
          ],
        ),
      ),
    );
  }

  // Method of calendar
  void _showCalendarPopup(BuildContext context) async {
    DateTime? selectDate = await showDatePicker(
      context: context,
      lastDate: DateTime.utc(2040, 10, 01),
      firstDate: DateTime.utc(2020, 01, 01),
    );
    if (selectDate != null) {
      setState(() {
        dateSelect = DateFormat('dd-MM-yyyy').format(selectDate);
        widget.onDateSelected!(dateSelect!);
      });
    }
  }

  // Method for image picker
  Future<void> _imagePicker() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Fluttertoast.showToast(msg: "Image is Picked");
      String fileName = pickedFile.name;
      int maxLength = 20; // Specify the maximum length you want
      fileName = fileName.length > maxLength
          ? "${fileName.substring(0, maxLength)}..."
          : fileName;
      setState(() {
        imageName = fileName;
        widget.onImageSelected!(pickedFile.path);
        widget.imageName!(imageName);
      });
    }
  }
}
