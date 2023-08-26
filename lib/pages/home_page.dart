import 'dart:convert';
import 'package:catalog/Models/cart.dart';
import 'package:catalog/Models/catalog.dart';
import 'package:catalog/store/store.dart';
import 'package:catalog/utils/routes.dart';
//import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";
import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  final url = "";
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      // scaffold return complete appbar and etc
      backgroundColor: Color.fromARGB(255, 242, 241, 242),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          tooltip: "See your cart!",
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Color.fromARGB(154, 126, 198, 181),
          child: Icon(CupertinoIcons.car_fill),
        ).badge(
            color: const Color.fromARGB(255, 208, 237, 235),
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHead(),
                  if (CatModel.items != null && CatModel.items.isNotEmpty)
                    CatalogList().py16().expand() // expand the tab
                  else
                    Center(child: CircularProgressIndicator()),
                ],
              ))),
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
              tooltip("Add to the cart"), //show message when long presses
              ElevatedButton(
                  onPressed: () {},
                  // need to change material state to change its color!
                  style: ButtonStyle(

                      // All means click, hover all
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  child: "Buy".text.make())
            ])
          ]))
    ])).white.rounded.square(400).make();
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
