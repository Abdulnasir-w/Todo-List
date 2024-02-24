import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/Constants/constats.dart';

class Pop {
  static void showBackDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Exit',
            style: GoogleFonts.montserrat(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w300),
          ),
          backgroundColor: primaryColor,
          content: Text(
            'Are you sure you want to leave this App ?',
            style: GoogleFonts.montserrat(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w300),
          ),
          actions: [
            TextButton(
              child: Text(
                'Wait',
                style: GoogleFonts.montserrat(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                'Exit',
                style: GoogleFonts.montserrat(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
