import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key, required this.icon, required this.iconColor,
  }) : super(key: key);
final IconData icon;
final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: getProportionalWidth(50),
        height: getProportionalHeight(50),
        decoration: BoxDecoration(
          color: kSearchFieldColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: getProportionalWidth(20),
          color: iconColor,
        ),
      ),
    );
  }
}
