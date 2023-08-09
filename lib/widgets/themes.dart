import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData Lighter(BuildContext context) => ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontFamily: AutofillHints.addressCity),
        ),
        appBarTheme: AppBarTheme(
          // changes color of all app bars!
          elevation: 0.0,

          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
