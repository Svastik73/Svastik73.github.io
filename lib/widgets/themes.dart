import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData Lighter(BuildContext context) => ThemeData(
        primarySwatch: Colors.amber,
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
}
