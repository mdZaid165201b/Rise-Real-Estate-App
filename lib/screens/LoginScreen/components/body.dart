import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../RegisterationScreen/registeration_screen.dart';
import 'LoginForm.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: getProportionalHeight(300),
            padding: EdgeInsets.symmetric(vertical: 0),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: getProportionalHeight(1.2)!,
              padding: EdgeInsets.symmetric(
                  vertical: getProportionalHeight(45)!,
                  horizontal: getProportionalWidth(15)!),
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                      child: Container(
                    // color: Colors.orange,
                    child: Image.asset(
                      'assets/images/onboard5.jpg',
                      height: getProportionalHeight(100),
                      width: getProportionalWidth(100),
                      fit: BoxFit.fill,
                    ),
                  )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                      child: Container(
                    // color: Colors.orange,
                    child: Image.asset(
                      'assets/images/home Apartment.jpg',
                      height: getProportionalHeight(100),
                      width: getProportionalWidth(100),
                      fit: BoxFit.fill,
                    ),
                  )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                      child: Container(
                    // color: Colors.orange,
                    child: Image.asset(
                      'assets/images/onboard2.jpg',
                      height: getProportionalHeight(100),
                      width: getProportionalWidth(100),
                      fit: BoxFit.fill,
                    ),
                  )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                      child: Container(
                    // color: Colors.orange,
                    child: Image.asset(
                      'assets/images/splash1.png',
                      height: getProportionalHeight(100),
                      width: getProportionalWidth(100),
                      fit: BoxFit.fill,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionalHeight(25),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(
                      TextSpan(
                          text: "Ready to ",
                          style: TextStyle(color: kTextColor1),
                          children: [
                            TextSpan(
                              text: 'explore?',
                              style: TextStyle(
                                  color: kHeadingColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: getProportionalWidth(20)),
                    ),
                  ),
                  SizedBox(
                    height: getProportionalHeight(55),
                  ),
                  CustomButton(
                    IconsSrc: "assets/icons/Mail.svg",
                    text: "Continue with Email",
                    press: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 500),
                            child: LoginForm(),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    Height: getProportionalHeight(65)!,
                    Width: getProportionalWidth(300)!,
                  ),
                  SizedBox(
                    height: getProportionalHeight(25),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: getProportionalHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(getProportionalHeight(25)!),
                        width: getProportionalWidth(150),
                        height: getProportionalHeight(80),
                        decoration: BoxDecoration(
                            color: kSearchFieldColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: SvgPicture.asset(
                          'assets/icons/google-icon.svg',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(getProportionalHeight(25)!),
                        width: getProportionalWidth(150),
                        height: getProportionalHeight(80),
                        decoration: BoxDecoration(
                            color: kSearchFieldColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: SvgPicture.asset('assets/icons/facebook-2.svg'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionalHeight(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Register Button Cliked!!");
                          Navigator.push(
                            context,
                            PageTransition(
                                child: RegisterationScreen(),
                                type: PageTransitionType.rightToLeft),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: kHeadingColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
