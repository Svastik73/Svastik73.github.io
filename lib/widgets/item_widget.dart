import 'package:catalog/Models/catalog.dart';
import 'package:flutter/material.dart';

class itemwidget extends StatelessWidget {
  final Item item;
  const itemwidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        child: ListTile(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(500)),
          leading: Image.network(item.imgurl),
          title: Text(
            item.name,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(
                color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
