import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/screens/LoginScreen/login_screen1.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../../utils/data.dart';

class OnBoardPagView extends StatefulWidget {
  const OnBoardPagView({Key? key}) : super(key: key);

  @override
  State<OnBoardPagView> createState() => _OnBoardPagViewState();
}

class _OnBoardPagViewState extends State<OnBoardPagView> {
  int pageIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: getProportionalHeight(20)!,
                left: getProportionalWidth(10)!,
                right: getProportionalWidth(10)!,
                bottom: 0),
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: getProportionalWidth(70),
                  height: getProportionalHeight(70),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: getProportionalHeight(35),
                    width: getProportionalWidth(80),
                    decoration: BoxDecoration(
                        color: Color(0xffDFDFDF),
                        borderRadius: BorderRadius.circular(45)),
                    child: Text(
                      'skip',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemCount: pageData.length,
                itemBuilder: ((context, index) {
                  return OnBoardingPageContent(
                    text1: pageData[index]['text1']!,
                    text2: pageData[index]['text2']!,
                    text3: pageData[index]['text3']!,
                    desc: pageData[index]['desc']!,
                    image: pageData[index]['image']!,
                    pageIndex: pageIndex,
                    backPress: () {
                      pageIndex = pageIndex - 1;
                      if (pageIndex >= 0) {
                        _pageController.animateToPage(pageIndex,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                        print(pageIndex);
                      }
                    },
                    press: () {
                      pageIndex = pageIndex + 1;
                      if (pageIndex <= 2) {
                        _pageController.animateToPage(pageIndex,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                        print(pageIndex);
                      } else {
                        print('else part');
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: LoginScreen(),
                                type: PageTransitionType.leftToRight));
                      }
                    },
                  );
                })),
          )
        ],
      ),
    );
  }
}

class OnBoardingPageContent extends StatelessWidget {
  const OnBoardingPageContent({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.desc,
    required this.image,
    required this.press,
    required this.pageIndex,
    required this.backPress,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String text3;
  final String desc;
  final String image;
  final VoidCallback press;
  final int pageIndex;
  final VoidCallback backPress;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: Container(
            padding: EdgeInsets.only(
                // top: getProportionalHeight(30)!,
                left: getProportionalWidth(20)!,
                right: getProportionalWidth(20)!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionalHeight(25),
                ),
                Text.rich(
                  TextSpan(
                    text: "${text1}\n",
                    children: [
                      TextSpan(text: '${text2} '),
                      TextSpan(
                          text: '${text3}',
                          style: TextStyle(
                              color: kHeadingColor,
                              fontWeight: FontWeight.bold))
                    ],
                    style: TextStyle(
                        fontSize: getProportionalWidth(24),
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: getProportionalHeight(25),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionalHeight(10)!,
                    bottom: getProportionalHeight(5)!,
                    left: getProportionalHeight(3)!,
                    right: getProportionalHeight(3)!,

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: pageIndex == 0 ? 5 : getProportionalWidth(30)!,
                      right: pageIndex == 0 ? 0 : getProportionalWidth(90)!),
                  child: Container(
                    width: double.infinity,
                    // color: Colors.red,

                    margin: EdgeInsets.only(
                        bottom: getProportionalHeight(35)!, left: 0),
                    child: Row(
                      mainAxisAlignment: pageIndex == 0
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        pageIndex == 0
                            ? SizedBox()
                            : GestureDetector(
                                onTap: backPress,
                                child: Container(
                                  // margin: EdgeInsets.only(right: 0,),
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.arrow_back),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                        CustomButton(
                            IconsSrc: "",
                            Height: 50,
                            Width: 170,
                            text: "Next",
                            press: press),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
