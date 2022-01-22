import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/authenticationpage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF4B3A),
      body: Column(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 50, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 73,
                      height: 73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 275,
                      height: 120,
                      child: Text(
                        "Food for Everyone",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 50,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: -80,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      'lib/assets/onboarding_image2.png',
                      height: 420,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: -50,
                  child: Image.asset(
                    'lib/assets/onboarding_image1.png',
                    height: 400,
                    width: 260,
                  ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Color(0xffFF470B).withOpacity(0.0),
                          Color(0xffFF470B).withOpacity(0.2),
                          Color(0xffFF470B).withOpacity(1.0),
                        ],
                        stops: [
                          0.1,
                          0.79,
                          1.0,
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color(0xffFF470B).withOpacity(0.8),
                    Color(0xffFF4B3A).withOpacity(1.0),
                  ],
                  stops: [
                    0.7,
                    1.0,
                  ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  height: 60,
                  width: 314,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthenticationPage()));
                    },
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffFF460A),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
