import 'dart:ffi';

class Food {
  String imagepath;
  String detailImagePath;
  String name;
  String description;
  double price;
  int count;
  bool faved;
  Food(
      {required this.imagepath,
      required this.detailImagePath,
      required this.name,
      required this.description,
      required this.price,
      required this.count,
      required this.faved});
}

List<Food> foodList = [
  Food(
    imagepath: "lib/assets/maskgroup_1.png",
    detailImagePath: "lib/assets/detailimage_1.png",
    name: "Veggie tomato mix",
    description: "description",
    price: 24.99,
    count: 1,
    faved: false,
  ),
  Food(
    imagepath: "lib/assets/maskgroup_2.png",
    detailImagePath: "lib/assets/detailimage_2.png",
    name: "Rice and Veggies",
    description: "description",
    price: 44.99,
    count: 1,
    faved: false,
  ),
  Food(
    imagepath: "lib/assets/maskgroup_3.png",
    detailImagePath: "lib/assets/detailimage_3.png",
    name: "Curly Pasta with peppers",
    description: "description",
    price: 50.99,
    count: 1,
    faved: false,
  ),
  Food(
    imagepath: "lib/assets/maskgroup_4.png",
    detailImagePath: "lib/assets/detailimage_4.png",
    name: "Thai Set",
    description: "description",
    price: 76.99,
    count: 1,
    faved: false,
  ),
];
