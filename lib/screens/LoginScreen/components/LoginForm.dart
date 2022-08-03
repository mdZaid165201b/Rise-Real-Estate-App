import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/screens/RegisterationScreen/registeration_screen.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../../components/custoFormField.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, int>> accountType = [
    {"CustomerTypeValue": 0},
    {"AgentTypeValue": 1}
  ];
  int currentSelect = 0;
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
                          text: "Let's ",
                          style: TextStyle(color: kTextColor1),
                          children: [
                            TextSpan(
                              text: "Sign In",
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
                      height: getProportionalHeight(50),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                    ),
                    SizedBox(
                      height: getProportionalHeight(10),
                    ),
                    Container(
                      width: double.infinity,
                      height: getProportionalHeight(50),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(18)!),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: kTextColor3,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Show password',
                                style: TextStyle(
                                  color: kTextColor3,
                                ),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: getProportionalHeight(25),
                    ),
                    SizedBox(
                      // height: getProportionalHeight(120),

                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                activeColor: kTextColor3,
                                title: Text(
                                  'Customer',
                                  style: TextStyle(color: kTextColor3),
                                ),
                                value: accountType[0]['CustomerTypeValue']!,
                                groupValue: currentSelect,
                                onChanged: (val) {
                                  setState(() {
                                    currentSelect = val as int;
                                    print(currentSelect);
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                // selected: true,
                                activeColor: kTextColor3,
                                title: Text(
                                  'Agent',
                                  style: TextStyle(color: kTextColor3),
                                ),
                                value: accountType[1]['AgentTypeValue']!,
                                groupValue: currentSelect,
                                onChanged: (val) {
                                  setState(() {
                                    currentSelect = val as int;
                                    print(currentSelect);
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionalHeight(25),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CustomButton(
                          text: 'Login',
                          press: () {
                            
                          },
                          Height: getProportionalHeight(65)!,
                          Width: getProportionalWidth(300)!,
                          IconsSrc: ''),
                    ),
                    SizedBox(
                      height: getProportionalHeight(25),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('OR',
                          style: TextStyle(color: Colors.black45),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: getProportionalHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionalWidth(15)!),
                      child: Row(
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
                            child:
                                SvgPicture.asset('assets/icons/facebook-2.svg'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionalHeight(25),
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
          ],
        ));
  }
}
