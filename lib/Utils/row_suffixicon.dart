// ignore_for_file: library_private_types_in_public_api, unnecessary_this, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Components/custom_imagepicker.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:core';

class MyRowSuffix extends StatefulWidget {
  final String title;
  final String asset;
  final Function(String)? onImageSelected;
  final Function(String)? onDateSelected;

  const MyRowSuffix({
    super.key,
    required this.title,
    required this.asset,
    this.onDateSelected,
    this.onImageSelected,
  });

  @override
  _MyRowSuffixState createState() => _MyRowSuffixState();
}

class _MyRowSuffixState extends State<MyRowSuffix> {
  String? dateSelect = "";
  String imageName = "";
  bool _isUploading = false;

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
              (dateSelect != null && dateSelect!.isNotEmpty)
                  ? dateSelect!
                  : (imageName.isNotEmpty ? imageName : widget.title),
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
                child: _isUploading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          strokeCap: StrokeCap.round,
                          valueColor: AlwaysStoppedAnimation<Color>(textColor),
                        ),
                      ) // Show CircularProgressIndicator when uploading
                    : SvgPicture.asset(widget.asset)),
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
  void _imagePicker() async {
    setState(() {
      _isUploading = true;
    });
    imagePicker((String imagePath) {
      Fluttertoast.showToast(msg: "Image is Picked");
      String fileName = imagePath.split("/").last;
      int maxLength = 10; // Specify the maximum length you want
      fileName = fileName.length > maxLength
          ? "${fileName.substring(0, maxLength)}..."
          : fileName;
      setState(() {
        imageName = fileName;
        widget.onImageSelected!(imagePath);
        _isUploading = false;
      });
    });
  }
}
