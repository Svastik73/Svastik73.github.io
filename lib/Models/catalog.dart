// ignore_for_file: empty_constructor_bodies

class CatModel {
  static List<Item> items = [
    Item(
      id: "skzr00001",
      name: "Mercedes A class",
      desc: "Mercedes-Benz A-Class Limousine",
      color: 'Red',
      price: 4800000,
      imgurl:
          "https://imgd.aeplcdn.com/1280x720/n/cw/ec/148959/mercedes-benz-a-class-limousine-left-front-three-quarter0.jpeg?isig=0",
    ),
  ];
}

class Item {
  final String id;
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
