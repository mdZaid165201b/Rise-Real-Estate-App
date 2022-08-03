import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    Key? key,
    required this.secttionTitle,
    required this.sectionOptionName,
    required this.press,
    required this.isPadding,
    required this.titleSize,
  }) : super(key: key);
  final String secttionTitle;
  final String sectionOptionName;
  final VoidCallback press;
  final bool isPadding;
  final double titleSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: isPadding
          ? EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!)
          : EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            secttionTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kHeadingColor,
              fontSize: titleSize,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              sectionOptionName,
              style: TextStyle(
                color: kHeadingColor,
                fontSize: getProportionalWidth(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
