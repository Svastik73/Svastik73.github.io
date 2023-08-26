import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../widgets/themes.dart';

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
            .color(Colors.teal)
            .make(), // equal to Text("")
        "TOP PICKS".text.xl2.color(Color.fromARGB(255, 40, 110, 71)).make(),
      ],
    );
  }
}
