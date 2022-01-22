import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/consts/food_data.dart';

class DetailsPage extends StatefulWidget {
  Food selectedFood;
  DetailsPage({Key? key, required this.selectedFood}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final database = FirebaseDatabase.instance.ref();
  bool faved = false;
  @override
  Widget build(BuildContext context) {
    final ref = database.child('cart');
    final favRef = database.child('favourites');

    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F2F2),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () async {
                try {
                  final nextRef = <String, dynamic>{
                    'name': widget.selectedFood.name,
                    'price': widget.selectedFood.price,
                    'imagepath': widget.selectedFood.imagepath,
                  };
                  String? key;
                  await database
                      .child('favourites')
                      .orderByChild('name')
                      .equalTo(widget.selectedFood.name)
                      .onChildAdded
                      .listen((event) {
                    setState(() {
                      key = event.snapshot.key.toString();
                    });
                  }, onError: (Object o) {
                    print(o.toString());
                  });
                  try {
                    favRef
                        .orderByChild('name')
                        .equalTo(widget.selectedFood.name)
                        .once()
                        .then((value) => {
                              if (value.snapshot.exists)
                                {
                                  database
                                      .child('favourites')
                                      .child(key!)
                                      .remove(),
                                  setState(() {
                                    widget.selectedFood.faved = false;
                                  }),
                                }
                              else
                                {
                                  database
                                      .child('favourites')
                                      .push()
                                      .set(nextRef),
                                  setState(() {
                                    widget.selectedFood.faved = true;
                                  }),
                                }
                            });
                  } catch (e) {
                    print(e.toString());
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              icon: ImageIcon(
                widget.selectedFood.faved
                    ? const AssetImage("lib/assets/favicon.png")
                    : const AssetImage("lib/assets/notfav_icon.png"),
                color: Colors.black,
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
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
            // Your widgets here
          ],
        ),
      ), //CustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage(widget.selectedFood.detailImagePath),
                        height: 241.21,
                        width: 241.21,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.selectedFood.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedFood.price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Color(0xffFA4A0C)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Delivery Info",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: Text(
                      "Delivered between monday and thursday from 8:00 pm to 11:00 pm",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Return policy",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: Text(
                      "All our foods are double checked before leaving our stores so by any case you found a spoiled food please contact our hotline immediately.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Color(0xffFA4A0C),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextButton(
                          onPressed: () async {
                            try {
                              final nextRef = <String, dynamic>{
                                'name': widget.selectedFood.name,
                                'price': widget.selectedFood.price,
                                'imagepath': widget.selectedFood.imagepath,
                                'count': 1,
                              };
                              String? key;
                              await database
                                  .child('cart')
                                  .orderByChild('name')
                                  .equalTo(widget.selectedFood.name)
                                  .onChildAdded
                                  .listen((event) {
                                setState(() {
                                  key = event.snapshot.key.toString();
                                });
                              }, onError: (Object o) {
                                print(o.toString());
                              });

                              try {
                                ref
                                    .orderByChild('name')
                                    .equalTo(widget.selectedFood.name)
                                    .once()
                                    .then((value) => {
                                          if (value.snapshot.exists)
                                            {
                                              database
                                                  .child('cart')
                                                  .child(key!)
                                                  .child('count')
                                                  .set(widget
                                                      .selectedFood.count++)
                                            }
                                          else
                                            {
                                              database
                                                  .child('cart')
                                                  .push()
                                                  .set(nextRef)
                                            }
                                        });
                              } catch (e) {
                                print(e.toString());
                              }
                            } catch (e) {
                              print('You got an error $e');
                            }

                            Navigator.pop(context);
                          },
                          child: Text(
                            "Add to chart",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //PreferredSizeWidget CustomAppBar(BuildContext context) =>
}
