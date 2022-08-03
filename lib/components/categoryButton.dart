import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getProportionalWidth(12)!),
      alignment: Alignment.center,
      padding: EdgeInsets.all(getProportionalHeight(8)!),
      constraints: BoxConstraints(
          minWidth: getProportionalWidth(width)!,
          minHeight: getProportionalHeight(height)!),
      decoration: BoxDecoration(
        color: isSelected
            ? kTextColor3.withOpacity(0.9)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : kTextColor3, fontSize: 14),
      ),
    );
  }
}