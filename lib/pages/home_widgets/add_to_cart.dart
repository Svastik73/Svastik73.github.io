// file for storing add to cart features for all the buttons appearing!
// this allows us to use the same code for whole code wherver "add to cart " is called
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/cart.dart';
import '../../Models/catalog.dart';
import '../../store/store.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    // will rebuild after listening to something
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation
    ]); // watch 2 to set reset "add to cart button"
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final _cart = CartModel(); now access cart with above method
    bool isAdded = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isAdded) {
            // isAdded = isAdded.toggle();

            //_cart.catalog = _catalog;
            AddMutation(catalog);
            //_cart.add(catalog);
            // only add to cart once!
            //   setState(() {
            //
            //   });
          }
        },
        // need to change material state to change its color!
        style: ButtonStyle(
            // All means click, hover all
            backgroundColor: MaterialStatePropertyAll(Colors.teal)),
        child: isAdded ? Icon(Icons.done) : Icon(CupertinoIcons.car_fill));
  }
}
