import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/screens/LocationScreen/LocationScreen.dart';

import '../../../components/custoFormField.dart';
import '../../../components/customButton.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../registeration_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _contactNoEditingController =
      TextEditingController();
  final TextEditingController _officeAddressEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final _customerFormKey = GlobalKey<FormState>();
  final _agentFormKey = GlobalKey<FormState>();
  int currentSelect = 0;

  bool isLoading = false;

  List<Map<String, dynamic>> radioButtons = [
    {
      "accountTypeName": "Customer",
      "accountTypeValue": 0,
    },
    {
      "accountTypeName": "Agent",
      "accountTypeValue": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionalHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(10)!),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: getProportionalWidth(50),
                          height: getProportionalHeight(50),
                          decoration: BoxDecoration(
                            color: kSearchFieldColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionalHeight(20),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(10)!),
                      child: Text.rich(
                        TextSpan(
                          text: "Create your ",
                          style: TextStyle(color: kTextColor1),
                          children: [
                            TextSpan(
                              text: "account",
                              style: TextStyle(
                                  color: kTextColor3,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        style: TextStyle(fontSize: getProportionalHeight(25)),
                      ),
                    ),
                    SizedBox(
                      height: getProportionalHeight(10),
                    ),
                    Container(
                      height: getProportionalHeight(50),
                      child: Row(children: [
                        Expanded(
                          child: RadioListTile(
                            activeColor: kTextColor3,
                            title: Text(radioButtons[0]['accountTypeName'],
                                style: TextStyle(color: kTextColor3)),
                            value: 0,
                            groupValue: currentSelect,
                            onChanged: (val) {
                              setState(() {
                                currentSelect = val as int;
                                print(currentSelect);
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            activeColor: kTextColor3,
                            title: Text(radioButtons[1]['accountTypeName'],
                                style: TextStyle(color: kTextColor3)),
                            value: 1,
                            groupValue: currentSelect,
                            onChanged: (val) {
                              setState(() {
                                currentSelect = val as int;
                                print(currentSelect);
                              });
                            },
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: getProportionalHeight(50),
                    ),
                    currentSelect == 0
                        ? Form(
                            key: _agentFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    hintText: 'Full Name',
                                    obsecure: false,
                                    svgSrc: 'assets/icons/User Icon.svg',
                                    inputType: TextInputType.name,
                                    controller: _nameEditingController),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  obsecure: false,
                                  svgSrc: 'assets/icons/Mail.svg',
                                  controller: _emailEditingController,
                                ),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Password',
                                  inputType: TextInputType.text,
                                  obsecure: true,
                                  svgSrc: 'assets/icons/Lock.svg',
                                  controller: _passwordEditingController,
                                ),
                              ],
                            ),
                          )
                        : Form(
                            key: _customerFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    hintText: 'Full Name',
                                    obsecure: false,
                                    svgSrc: 'assets/icons/User Icon.svg',
                                    inputType: TextInputType.name,
                                    controller: _nameEditingController),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  obsecure: false,
                                  svgSrc: 'assets/icons/Mail.svg',
                                  controller: _emailEditingController,
                                ),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Contact No',
                                  inputType: TextInputType.phone,
                                  obsecure: false,
                                  svgSrc: 'assets/icons/Call.svg',
                                  controller: _contactNoEditingController,
                                ),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Office Address',
                                  inputType: TextInputType.text,
                                  obsecure: false,
                                  svgSrc: 'assets/icons/Location point.svg',
                                  controller: _officeAddressEditingController,
                                ),
                                SizedBox(
                                  height: getProportionalHeight(15),
                                ),
                                CustomTextField(
                                  hintText: 'Password',
                                  inputType: TextInputType.text,
                                  obsecure: true,
                                  svgSrc: 'assets/icons/Lock.svg',
                                  controller: _passwordEditingController,
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: getProportionalHeight(10),
                    ),
                    Container(
                      width: double.infinity,
                      height: getProportionalHeight(50),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(18)!),
                      child: Text(
                        'Show password',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: kTextColor3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionalHeight(15),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: isLoading
                          ? Container(
                              width: getProportionalWidth(300),
                              height: getProportionalHeight(65),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : CustomButton(
                              text: 'Register',
                              press: () {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(
                                  Duration(seconds: 2),
                                  () {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     PageTransition(
                                    //         child: LocationScreen(),
                                    //         type: PageTransitionType
                                    //             .rightToLeft));
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: LocationScreen(),
                                            type: PageTransitionType
                                                .rightToLeft));
                                  },
                                );
                              },
                              Height: getProportionalHeight(65)!,
                              Width: getProportionalWidth(300)!,
                              IconsSrc: ''),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
