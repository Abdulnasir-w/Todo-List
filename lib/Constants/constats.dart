import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color scaffoldbg = const Color(0xffFFFFFF);
Color primaryColor = const Color(0xffF79E89);
Color secondryColor = const Color(0xffF76C6A);
Color textColor = const Color(0xffF0F0F0);

TextStyle primaryStyle = GoogleFonts.montserrat(
  color: Colors.black38,
  fontSize: 16,
);

TextStyle secondryStyle = GoogleFonts.montserrat(
    color: textColor, fontSize: 18, fontWeight: FontWeight.w300);

TextStyle txtBtnColor = GoogleFonts.montserrat(
  color: primaryColor,
  fontSize: 12,
);
TextStyle menuTextStyle = GoogleFonts.montserrat(
  color: const Color(0xff272727),
  fontSize: 16,
);
TextStyle menuTextStyleSecondry = GoogleFonts.montserrat(
  color: secondryColor,
  fontSize: 16,
);
//Todo Add scree Style

TextStyle addHintStyle = GoogleFonts.montserrat(
    fontSize: 16, color: scaffoldbg, fontWeight: FontWeight.w400);

// Profile Screen Text Style

TextStyle nameStyle = GoogleFonts.montserrat(
  color: primaryColor,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

// Home Screen TextColor Title
TextStyle titleStyle = GoogleFonts.montserrat(
    color: textColor, fontSize: 16, fontWeight: FontWeight.w400);
// description
TextStyle descriptionStyle = GoogleFonts.montserrat(
  color: textColor,
  fontSize: 14,
);
// createdDate
TextStyle dateStyle = GoogleFonts.montserrat(
  color: textColor,
  fontSize: 11,
);
