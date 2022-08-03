import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/screens/onboarding_screen/components/pageViewBuilder.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../../components/customButton.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/splash1.png',
              fit: BoxFit.none,
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 0.9),
                colors: [
                  Color(0xff21628A).withOpacity(0.0),
                  Color(0xff1F4C6B).withOpacity(1),
                ],
              ),
              // color: Color(0xff21628A).withOpacity(0.1)
            ),
          ),
        ),
        Align(
          // alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: getProportionalWidth(220),
            height: getProportionalHeight(220),
            child: Image.asset(
              'assets/images/logo.png',
              color: kPrimaryColor,
            ),
          ),
        ),
        Positioned(
          top: getProportionalHeight(450),
          // left: getProportionalWidth(150),
          child: Container(
            // alignment: Alignment.center,
            child: Text(
              'Rise\nReal Estate',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionalHeight(25),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              IconsSrc: "",
              Height: 54,
              Width: 200,
              text: "let's start",
              press: () {
                print("let's strat button clicked");
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    alignment: Alignment.center,
                    duration: Duration(seconds: 2),
                    curve: Curves.bounceIn,
                      child: OnBoardPagView(), type: PageTransitionType.scale),
                );
              },
            ),
            SizedBox(
              height: getProportionalHeight(70),
            )
          ],
        ))
      ],
    );
  }
}
