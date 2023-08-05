import 'dart:convert';
import 'package:catalog/Models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // wait till it acess items
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    final decode = jsonDecode(catalogjson); // decode json
    var productdata = decode["products"];
    CatModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final dumlist = List.generate(50, (index) => catmodel.Items[0]);
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
        child: (CatModel.items != null &&
                CatModel.items.isNotEmpty) // 2 value in row
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final item = CatModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: GridTile(
                          header: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          child: Image.network(item.imgurl)));
                },
                itemCount: CatModel.items.length,
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
