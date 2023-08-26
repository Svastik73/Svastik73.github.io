import 'package:catalog/Models/cart.dart';
import 'package:catalog/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

// store all operations done in store
class MyStore extends VxStore {
  CatModel catalog = CatModel();
  CartModel cart = CartModel();
  MyStore() {
    catalog = CatModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
