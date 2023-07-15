import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cataloge app!"),
        backgroundColor: Color.fromARGB(255, 0, 255, 225),
        shadowColor: Color.fromARGB(255, 16, 15, 14),
      ),
      body: Center(
        child: Container(
          child: Text("Hello"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
