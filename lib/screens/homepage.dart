import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery_app/consts/food_data.dart';
import 'package:food_delivery_app/consts/utils.dart';
import 'package:food_delivery_app/screens/cart.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/screens/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var scaffoldkey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Food> foods = Utils.getMockedFoods();

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF2F2F2),
      //drawer: CustomDrawer(),
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Color(0xffF2F2F2),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
              color: Colors.black,
              icon: ImageIcon(AssetImage("lib/assets/drawer.png")),
              onPressed: () => scaffoldkey.currentState?.openDrawer()), //
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Image(
                image: AssetImage("lib/assets/shopping-cart.png"),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
              child: SizedBox(
                width: 200,
                child: Text(
                  "Delicious food for you ",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                child: TextFormField(
                  cursorColor: Colors.black,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ImageIcon(AssetImage("lib/assets/searchicon.png"),
                          color: Colors.black),
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  labelColor: Color(0xffFA4A0C),
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Tab(
                        text: 'Foods',
                      ),
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                    Tab(
                      text: 'Snacks',
                    ),
                    Tab(
                      text: 'Sauces',
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Color(0xffFA4A0C),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: CarouselSlider.builder(
                      itemCount: 4,
                      itemBuilder: (context, index, realIndex) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        selectedFood: foods[index])));
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 320,
                                width: 220,
                                child: Card(
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 130,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(foodList[index].name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          r"$" +
                                              foodList[index].price.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xffFA4A0C),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -30,
                                left: -12,
                                child: Image(
                                  image: AssetImage(foodList[index].imagepath),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                          height: 270.0,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          initialPage: 0,
                          enlargeCenterPage: false,
                          viewportFraction: 0.7),
                    ),
                  ),
                  Center(
                    child: Text("Screen 2"),
                  ),
                  Center(
                    child: Text("Screen 3"),
                  ),
                  Center(
                    child: Text("Screen 4"),
                  ),
                  Center(
                    child: Text("Screen 5"),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
Widget foodCard(int index) => Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 320,
          width: 220,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(foodList[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      r"$" + foodList[index].price.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffFA4A0C),
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: -12,
          child: Image(
            image: AssetImage(foodList[index].imagepath),
          ),
        ),
      ],
    );

*/
