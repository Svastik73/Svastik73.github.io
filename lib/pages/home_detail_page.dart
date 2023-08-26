import 'package:catalog/pages/home_widgets/add_to_cart.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/services/system_sound.dart';
import '../Models/catalog.dart';

// This page opens when we click a car tab!
class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 135, 189, 177),
        child: ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
          "\$${catalog.price}".text.bold.xl.make(),
          /* ElevatedButton(
                  onPressed: () => SystemSound.play(SystemSoundType.alert),
                  // need to change material state to change its color!
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                          // ,aterial state becuase it(shapeBorder) was valid for inkwell only
                          StadiumBorder()), // round shaped
                      // All means click, hover all
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  child: "ADD TO CART".text.center.make())
              .wh(170, 32)*/ // we used this button which didnt responed when we earlier clicked
          AddToCart(catalog: catalog).wh(120, 40)
        ]).py12(),
      ),
      body: SafeArea(
          bottom: false, // mixes with environment!
          child: Column(children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.imgurl))
                .wHalf(context)
                .h40(context),
            Expanded(
                child: VxArc(
                    height: 50,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                        color: Colors.blueGrey,
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl5
                                .color(Color.fromARGB(255, 250, 249, 249))
                                .make(),
                            catalog.desc.text.xl2
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
                          ],
                        ).py64())))
          ])),
    );
  }
}
