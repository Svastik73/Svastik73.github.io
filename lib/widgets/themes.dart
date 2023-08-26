import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // we used ThemeData to change themes
  static ThemeData Lighter(BuildContext context) => ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontFamily: AutofillHints.addressCity),
        ),
        cardColor: Colors.white,
        canvasColor: Colors.black45,
        hintColor: Color.fromARGB(255, 76, 82, 85),
        splashColor: darkBluishColor,
        appBarTheme: AppBarTheme(
          // changes color of all app bars!
          elevation: 0.0,

          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontFamily: AutofillHints.addressCity),
        ),
        cardColor: Colors.black,
        canvasColor: Vx.gray800,
        brightness: Brightness.dark,
        splashColor: lightBluishColor,
        hintColor: Colors.white24,
        buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
        appBarTheme: AppBarTheme(
          // changes color of all app bars!
          elevation: 0.0,

          color: Color.fromARGB(255, 13, 5, 5),
          iconTheme: IconThemeData(color: Color.fromARGB(231, 252, 252, 252)),
        ),
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkCreamColor = Vx.gray600;
  static Color lightBluishColor = Vx.indigo500;
}
