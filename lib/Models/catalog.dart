// ignore_for_file: empty_constructor_bodies

class CatModel {
  // singleton
  /*static final catModel = CatModel._internal();
  CatModel._internal();
  factory CatModel() =>
      catModel; */
  // whenever object is called return this class!
  static List<Item> items = [
    Item(
      id: 1,
      name: "Mercedes A class",
      desc: "Mercedes-Benz A-Class Limousine",
      color: 'Red',
      price: 35000,
      imgurl:
          "https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Mercedes-Benz-A-Class-Limousine-100420211633.jpg&w=373&h=245&q=75&c=1",
    ),
  ];
  // get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgurl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imgurl});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      // convert map to class
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imgurl: map["imgurl"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        price: "price",
        color: "color",
        imgurl: "imgurl"
      };
}
