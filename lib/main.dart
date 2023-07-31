// ignore: unused_import
import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:
          MyTheme.Lighter(context), // use our defined class for this purpose!
      debugShowCheckedModeBanner: false, // remove debug banner!

      initialRoute:
          MyRoutes.homeRoute, // first page that will be shown to user!
      routes: {
        "/": (context) => LoginPage(), // class name
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
