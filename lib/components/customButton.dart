import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.press,
    required this.Height,
    required this.Width,
    required this.IconsSrc,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final double Width;
  final double Height;
  final String IconsSrc;
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: press,
    //   child: Container(
    //     alignment: Alignment.center,
    //     height: getProportionalHeight(54),
    //     width: getProportionalWidth(200),
    //     decoration: BoxDecoration(
    //         color: kPrimaryColor, borderRadius: BorderRadius.circular(15)),
    //     child: Text(
    //       text,
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: getProportionalWidth(17),
    //       ),
    //     ),
    //   ),
    // );
    return ElevatedButton(
      onPressed: press,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconsSrc.isNotEmpty
            ? Container(
                margin: EdgeInsets.only(right: getProportionalWidth(3)!),
                child: SvgPicture.asset(
                  IconsSrc,
                  color: Colors.white,
                ),
              )
            : Container(),
        Text(text)
      ]),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: TextStyle(fontSize: getProportionalWidth(17)),
        primary: kPrimaryColor,
        fixedSize: Size(Width, Height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
