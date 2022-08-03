import 'package:flutter/material.dart';
import 'package:rise_real_estate/screens/onboarding_screen/onBoarding_screen.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rise Real Estate',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kTextColor1),
          bodyText2: TextStyle(color: kTextColor2),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black87),
          elevation: 0,
        ),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Muli',
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: routes,
    );
  }
}
