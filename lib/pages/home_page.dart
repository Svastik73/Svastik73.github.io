import 'package:catalog/Models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final dumlist = List.generate(50, (index) => catmodel.Items[0]);
    return Scaffold(
      // scaffold return complete appbar and etc
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          "BELUGA inc",
          style: TextStyle(fontStyle: FontStyle.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dumlist.length,
          //itemCount: catmodel.Items.length,
          itemBuilder: (BuildContext context, int index) {
            return itemwidget(
              item: dumlist[index],
              // item: catmodel.Items[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
