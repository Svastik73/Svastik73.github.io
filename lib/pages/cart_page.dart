import 'package:catalog/store/store.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "CART".text.make(),
        ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            Divider(),
            _CartTotal(), //self made
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild happened");
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
              mutations: {RemoveMutation},
              builder: (context, _, __) {
                return "\$${_cart.totalPrice}"
                    .text
                    .color(context.theme.hintColor)
                    .xl5
                    .make();
              },
            ),
            12.widthBox,
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.hintColor)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.transparent,
                  content: "Buying not supported"
                      .text
                      .color(Color.fromARGB(220, 18, 1, 1))
                      .make(),
                ));
              },
              child: Text(
                "Buy",
                style: TextStyle(
                    fontSize: 23, color: Color.fromARGB(235, 246, 242, 242)),
              ),
            ).w32(context)
          ],
        ));
  }
}

// make statefull to stateless
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final _cart = CartModel();
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart
            .items.isEmpty // show this string if cart is empty else shows list!
        ? "Nothing to show :)"
            .text
            .color(Colors.blueGrey)
            .semiBold
            .xl2
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  // removes item selected when clicke "-" button
                  //   setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
