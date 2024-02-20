// ignore_for_file: library_private_types_in_public_api, unnecessary_this, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:image_picker/image_picker.dart';

class MyRowSuffix extends StatefulWidget {
  final String title;
  final String asset;

  const MyRowSuffix({
    super.key,
    required this.title,
    required this.asset,
  });

  @override
  _MyRowSuffixState createState() => _MyRowSuffixState();
}

class _MyRowSuffixState extends State<MyRowSuffix> {
  String? dateSelect = "";
  String imageName = "";

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
      });
    }
  }

  // Method for image picker
  void _imagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Fluttertoast.showToast(msg: "Image is Picked");
      String fileName = pickedFile.path.split("/").last;
      setState(() {
        imageName = fileName;
      });
    }
  }
}
