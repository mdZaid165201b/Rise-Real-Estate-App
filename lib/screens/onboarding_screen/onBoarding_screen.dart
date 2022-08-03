import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import 'components/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static String routeName = '/onboarding_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
