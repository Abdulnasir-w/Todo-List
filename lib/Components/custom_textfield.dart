import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Constants/constats.dart';

class MyCustomTextField extends StatefulWidget {
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isPassField;

  const MyCustomTextField({
    super.key,
    this.keyboardType,
    required this.title,
    this.controller,
    this.isPassField = false,
  });

  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  late FocusNode _focusNode;
  bool isVisible = true; // Initialize isVisible to false

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        // Rebuild the widget when the focus changes
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasFocus = _focusNode.hasFocus;
    return SizedBox(
      width: 500,
      height: 50,
      child: TextFormField(
        obscureText: widget.isPassField
            ? isVisible
            : false, // Toggle the visibility based on isVisible
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.title,
          hintStyle: GoogleFonts.montserrat(
            color: hasFocus ? primaryColor : Colors.black38,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: primaryColor,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          suffixIcon: widget.isPassField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible =
                          !isVisible; // Toggle isVisible when the button is pressed
                    });
                  },
                  icon: Icon(
                    isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: hasFocus ? primaryColor : Colors.grey,
                  ),
                )
              : null, // Don't show a suffix icon if it's not a password field
        ),
      ),
    );
  }
}
