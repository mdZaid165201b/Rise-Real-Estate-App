import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.obsecure,
    required this.svgSrc,
    required this.inputType,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final bool obsecure;
  final String svgSrc;
  final TextInputType inputType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(15)!),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure,
        keyboardType: inputType,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: kSearchFieldColor,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: getProportionalHeight(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: kTextColor3, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          border: InputBorder.none,
          suffixIcon: Container(
            padding: EdgeInsets.all(getProportionalHeight(13)!),
            child: SvgPicture.asset(
              svgSrc,
              color: kTextColor3,
            ),
          ),
        ),
      ),
    );
  }
}