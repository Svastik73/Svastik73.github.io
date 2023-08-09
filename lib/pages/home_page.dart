import 'dart:convert';
import 'package:catalog/Models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";

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
      backgroundColor: Color.fromARGB(255, 242, 241, 242),
      body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHead(),
                  if (CatModel.items != null && CatModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    Center(child: CircularProgressIndicator()),
                ],
              ))),
    );
  }
}

class CatalogHead extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        "BELUGA inc"
            .text
            .bold
            .xl4
            .color(MyTheme.darkBluishColor)
            .make(), // equal to Text("")
        "TOP PICKS".text.xl2.color(Color.fromARGB(255, 40, 110, 71)).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  @override
  final Item catalog;
  const CatalogItem({key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      // return constructor here

      CatalogImage(image: catalog.imgurl),
      Expanded(
          // expands row!
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            catalog.name.text.xl2.color(Colors.teal).make(),
            Text(
              "Desc: ",
              style: TextStyle(color: Colors.black),
            ),
            catalog.desc.text
                .textStyle(context.captionStyle)
                .color(Colors.blueGrey)
                .make(),
            ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
              "\$${catalog.price}".text.bold.xl.make(),
              ElevatedButton(
                  onPressed: () {},
                  // need to change material state to change its color!
                  style: ButtonStyle(
                      // All means click, hover all
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  child: "Buy".text.make())
            ])
          ]))
    ])).white.rounded.square(200).make();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .width(100)
        .rounded
        .height(89)
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .wOneThird(context);
  }
}
