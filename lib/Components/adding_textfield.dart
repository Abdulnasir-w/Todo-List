import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Constants/constats.dart';

class AddingTextField extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController? controller;
  final String title;
  final int? lines;
  const AddingTextField({
    super.key,
    required this.width,
    required this.height,
    this.controller,
    required this.title,
    this.lines,
  });

  @override
  State<AddingTextField> createState() => _AddingTextFieldState();
}

class _AddingTextFieldState extends State<AddingTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        maxLines: widget.lines ?? 1,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle: addHintStyle,
          hintTextDirection: TextDirection.ltr,
          hintMaxLines: widget.lines,
          fillColor: Colors.transparent,
          filled: true,
          isDense: false,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
