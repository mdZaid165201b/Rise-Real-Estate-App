import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class CustomSaleBanner extends StatelessWidget {
  const CustomSaleBanner({
    Key? key, required this.saleText, required this.discountText, required this.press, required this.imageSrc,
  }) : super(key: key);

  final String saleText;
  final String discountText;
  final String imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionalHeight(250),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionalWidth(10)!,
          vertical: getProportionalHeight(10)!),
      child: Container(
        height: getProportionalHeight(250),
        width: getProportionalWidth(250),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.overlay),
                image: AssetImage(imageSrc),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(20)!,
                      vertical: getProportionalHeight(10)!),
                  child: Text.rich(
                    TextSpan(
                      text: "${saleText}\n",
                      children: [
                        TextSpan(text: "Sale!\n"),
                        TextSpan(
                          text: discountText,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: getProportionalWidth(15),
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionalWidth(24),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: getProportionalHeight(60),
                width: getProportionalWidth(120),
                decoration: BoxDecoration(
                  color: kTextColor3,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}