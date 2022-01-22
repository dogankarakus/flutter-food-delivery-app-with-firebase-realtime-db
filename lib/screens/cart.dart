// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_app/consts/cart_food.dart';
import 'package:food_delivery_app/consts/food_data.dart';
import 'package:food_delivery_app/screens/details_page.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  List<CartFood> cartFoodList = [];

  void _activateListeners() {
    final _cartStream = database.child('cart').onValue.listen((event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      cartFoodList.clear();
      map.forEach((key, value) {
        var cartFood = CartFood.fromJson(json.decode(json.encode(value)));
        cartFood.key = key;
        cartFoodList.add(cartFood);
      });
      setState(() {
        cartFoodList = cartFoodList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final readCartRef = database.child('cart');

    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: UsualAppBar(context, "Cart"),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("lib/assets/swipeitem.png")),
                Text(
                  "swipe on an item to delete",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: cartFoodList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                      child: Container(
                        width: 315,
                        height: 102,
                        child: Slidable(
                          endActionPane: ActionPane(children: [
                            SlidableAction(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Color(0xffDF2C2C),
                              icon: Icons.favorite,
                              onPressed: (context) {},
                            ),
                            SlidableAction(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Color(0xffDF2C2C),
                              icon: Icons.delete,
                              onPressed: (context) {
                                deleteFromDatabase(
                                    database, cartFoodList[index]);
                              },
                            ),
                          ], motion: ScrollMotion()),
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Image(
                                    image: AssetImage(
                                        cartFoodList[index].imagepath!),
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Positioned(
                                  left: 120,
                                  top: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartFoodList[index].name.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cartFoodList[index].price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Color(0xffFA4A0C)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 20,
                                    bottom: 10,
                                    child: ItemPropotion(cartFoodList[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xffFA4A0C),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  "Complete Order",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteFromDatabase(
      DatabaseReference database, CartFood cartFood) async {
    final ref = database.child('cart');
    String? key;
    database
        .child('cart')
        .orderByChild('name')
        .equalTo(cartFood.name)
        .onChildAdded
        .listen((event) {
      setState(() {
        key = event.snapshot.key.toString();
      });
    }, onError: (Object o) {
      print(o.toString());
    });

    try {
      ref.orderByChild('name').equalTo(cartFood.name).once().then((value) => {
            if (value.snapshot.exists)
              {
                database.child('cart').child(key!).remove(),
              }
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> changePortion(
      bool increase, DatabaseReference database, CartFood? cartFood) async {
    final ref = database.child('cart');
    String? key;
    database
        .child('cart')
        .orderByChild('name')
        .equalTo(cartFood!.name)
        .onChildAdded
        .listen((event) {
      setState(() {
        key = event.snapshot.key.toString();
      });
    }, onError: (Object o) {
      print(o.toString());
    });
    try {
      ref.orderByChild('name').equalTo(cartFood.name).once().then((value) => {
            if (value.snapshot.exists)
              {
                if (increase)
                  {
                    database
                        .child('cart')
                        .child(key!)
                        .child('count')
                        .set(cartFood.count! + 1),
                  }
                else
                  {
                    if (value.snapshot.child(key!).child('count').value == 1)
                      {
                        database.child('cart').child(key!).remove(),
                      }
                    else
                      {
                        database
                            .child('cart')
                            .child(key!)
                            .child('count')
                            .set(cartFood.count! - 1),
                      }
                  }
              }
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Widget ItemPropotion(CartFood cartfood) => Container(
        height: 25,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Color(0xffFA4A0C)),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              top: -10,
              child: IconButton(
                color: Colors.white,
                iconSize: 15,
                splashRadius: 20,
                onPressed: () {
                  changePortion(false, database, cartfood);
                },
                icon: ImageIcon(AssetImage("lib/assets/-.png")),
              ),
            ),
            Positioned(
                top: 5,
                left: 25,
                child: Text(cartfood.count.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            Positioned(
              right: -10,
              top: -10,
              child: IconButton(
                color: Colors.white,
                iconSize: 15,
                splashRadius: 20,
                onPressed: () {
                  changePortion(true, database, cartfood);
                },
                icon: ImageIcon(AssetImage("lib/assets/+.png")),
              ),
            ),
          ],
        ),
      );
}

PreferredSizeWidget UsualAppBar(BuildContext context, String title) => AppBar(
      backgroundColor: Color(0xffF2F2F2),
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40, // Your Height
            width: 40, // Your width
            child: IconButton(
              // Your drawer Icon
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ImageIcon(
                AssetImage("lib/assets/appbar_back.png"),
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 120,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          // Your widgets here
        ],
      ),
    );
