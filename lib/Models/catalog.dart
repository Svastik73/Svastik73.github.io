class catmodel {
  static final Items = [
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
}
