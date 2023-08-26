
import 'package:catalog/pages/home_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context, // on clicking it navigates to its own page!
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
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
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.imgurl),
      ),
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
              AddToCart(catalog: catalog), // pass to next class constructor!
            ])
          ]))
    ])).color(context.cardColor).white.rounded.square(200).make();
  }
}
