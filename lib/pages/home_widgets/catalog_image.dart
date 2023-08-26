import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .width(220)
        .rounded
        .height(190)
        .p8
        .color(context.canvasColor)
        //.color(MyTheme.creamColor)
        .make()
        .p16()
        .wOneThird(context);
  }
}
