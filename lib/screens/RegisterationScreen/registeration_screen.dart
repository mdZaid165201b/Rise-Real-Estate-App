import 'package:flutter/material.dart';
import 'package:rise_real_estate/screens/RegisterationScreen/components/body.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({Key? key}) : super(key: key);
  static String routeName = '/registeration_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      
    );
  }
}
