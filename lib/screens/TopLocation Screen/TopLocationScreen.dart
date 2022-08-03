import 'package:flutter/material.dart';
import 'package:rise_real_estate/screens/TopLocation%20Screen/components/body.dart';

class TopLocationScreen extends StatelessWidget {
  const TopLocationScreen({Key? key}) : super(key: key);
  static String routeName = 'top-location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
