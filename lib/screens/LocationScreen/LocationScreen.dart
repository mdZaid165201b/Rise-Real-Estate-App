import 'package:flutter/material.dart';
import 'package:rise_real_estate/screens/LocationScreen/components/body.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);
  static String routeName = '/locationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
