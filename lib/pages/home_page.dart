import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // scaffold return complete appbar and etc
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          "BELUGA inc",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Hello"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
