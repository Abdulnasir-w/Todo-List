import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Constants/constats.dart';

class MyCustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorText;
  final VoidCallback onPressed;
  final bool isLoading;
  const MyCustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
    required this.colorText,
    required this.isLoading,
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
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor),
                  ),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(color: colorText, fontSize: 14),
                ),
              ),
      ),
    );
  }
}
