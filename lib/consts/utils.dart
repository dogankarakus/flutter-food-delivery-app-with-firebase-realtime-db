import 'package:food_delivery_app/consts/food_data.dart';

class Utils {
  static List<Food> getMockedFoods() {
    return [
      Food(
        imagepath: foodList[0].imagepath,
        detailImagePath: foodList[0].detailImagePath,
        name: foodList[0].name,
        description: foodList[0].description,
        price: foodList[0].price,
        count: 1,
        faved: false,
      ),
      Food(
        imagepath: foodList[1].imagepath,
        detailImagePath: foodList[1].detailImagePath,
        name: foodList[1].name,
        description: foodList[1].description,
        price: foodList[1].price,
        count: 1,
        faved: false,
      ),
      Food(
        imagepath: foodList[2].imagepath,
        detailImagePath: foodList[2].detailImagePath,
        name: foodList[2].name,
        description: foodList[2].description,
        price: foodList[2].price,
        count: 1,
        faved: false,
      ),
      Food(
        imagepath: foodList[3].imagepath,
        detailImagePath: foodList[3].detailImagePath,
        name: foodList[3].name,
        description: foodList[3].description,
        price: foodList[3].price,
        count: 1,
        faved: false,
      ),
    ];
  }
}
