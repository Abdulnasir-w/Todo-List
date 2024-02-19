import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorText;
  final VoidCallback onPressed;
  const MyCustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.montserrat(color: colorText, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
