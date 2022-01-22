import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/homepage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F8),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7.0,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    spreadRadius: 5.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    child: Center(
                      child: Image(
                        image: AssetImage("lib/assets/Food.png"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: [
                        Tab(
                          text: '        Login        ',
                        ),
                        Tab(
                          text: '       Sign-up       ',
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color(0xffFA4A0C),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 60.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildPasswordField('Password'),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Color(0xffFA4A0C)),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFF460A),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 60,
                              width: 314,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text("Screen 2"),
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

Widget buildPasswordField(String label) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      key: ValueKey('password'),
      autocorrect: false,
      enableSuggestions: false,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}

Widget buildEmailField() {
  return SizedBox(
    height: 60,
    child: TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}
