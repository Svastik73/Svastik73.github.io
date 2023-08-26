import 'package:catalog/Models/catalog.dart';
import 'package:catalog/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // singleton
  /* static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() =>
      cartModel;*/ // whenever object is called return this class!
  // catalog field
  late CatModel _catalog;

  // collection to store ids of each
  List<int> _itemIds = [];
  // ignore: recursive_getters
  CatModel get catalog => _catalog;
  set catalog(CatModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price;
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add items

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    // youtub e version

    store!.cart._itemIds.add(item.id);
  }
}

// remove object
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    // youtub e version

    store!.cart._itemIds.remove(item.id);
  }
}
