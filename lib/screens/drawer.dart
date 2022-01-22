import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFA4A0C),
      body: Stack(
        children: [
          Positioned(
              right: 2,
              top: 120,
              child: Image(
                image: AssetImage("lib/assets/drawer_design1_shadow.png"),
              )),
          Positioned(
              top: 100,
              right: 0,
              child: Image(
                image: AssetImage("lib/assets/drawer_design1.png"),
              )),
          Positioned(
            left: 30,
            top: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("lib/assets/drawer_icon1.png"),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("lib/assets/drawer_icon2.png"),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("lib/assets/drawer_icon3.png"),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Offer and Promo",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("lib/assets/drawer_icon4.png"),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 40,
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("lib/assets/drawer_icon5.png"),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Security",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 30,
              child: Row(
                children: [
                  Text(
                    "Sign-out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ImageIcon(AssetImage("lib/assets/signoutarrow.png"),
                      color: Colors.white),
                ],
              ))
        ],
      ),
    );
  }
}
