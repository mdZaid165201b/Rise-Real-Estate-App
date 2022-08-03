import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class CustomeSearchField extends StatelessWidget {
  const CustomeSearchField({
    Key? key, required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
      margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(30)!),
      height: getProportionalHeight(70),
      // width: getProportionalWidth(size.width),
      decoration: BoxDecoration(
        color: kSearchFieldColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        // cursorHeight: 20,
        cursorColor: kTextColor1,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: kTextColor1,
            ),
            prefixIconConstraints: BoxConstraints(
                maxWidth: getProportionalWidth(30)!,
                maxHeight: getProportionalHeight(25)!),
            hintText: "Search House, Apartment etc",
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
              fontSize: getProportionalWidth(16),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
