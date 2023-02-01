import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

//Styles
ButtonStyle kTextButtonStyle(BuildContext context) => TextButton.styleFrom(
      backgroundColor: Colors.blue,
      padding: EdgeInsets.all(kScreenWidth(context) * 0.03),
    );

InputDecoration kTextFieldDecoration(String text) => InputDecoration(
      labelText: text,
      contentPadding: const EdgeInsets.all(8.0),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );

BoxDecoration backgroundDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff45b6fe),
      Color(0xff3792cb),
      Color(0xff45b6fe),
      Color(0xff3792cb),
      Color(0xff45b6fe),
    ],
  ),
);

TextStyle headingTextStyle(BuildContext context) => GoogleFonts.raleway(
     color: Colors.white, fontSize: screenWidth(context) * 0.1,
    );

TextStyle headingSubTextStyle(BuildContext context) => GoogleFonts.raleway(
      color: Colors.black54,
      fontSize: screenWidth(context) * 0.048,
    );

TextStyle tileHeadingTextStyle(BuildContext context) => GoogleFonts.raleway(
      color: Colors.black54,
      fontSize: screenWidth(context) * 0.048,
    );

TextStyle faqTileSubheadingTextStyle(BuildContext context) =>
    GoogleFonts.raleway(
      color: Colors.black54,
      fontSize: screenWidth(context) * 0.043,
    );
