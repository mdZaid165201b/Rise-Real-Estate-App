import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class TopLocationCard extends StatelessWidget {
  const TopLocationCard({
    Key? key,
    required this.locationTitle,
    required this.imageSrc,
    required this.press,
  }) : super(key: key);
  final String locationTitle;
  final String imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionalWidth(10)!),
        margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
        height: getProportionalHeight(70),
        // width: getProportionalWidth(120),
        constraints: BoxConstraints(
          minWidth: getProportionalWidth(120)!,
          // minHeight: getProportionalHeight(70)!,
        ),
        decoration: BoxDecoration(
          color: kSearchFieldColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 0.5,
            color: kHeadingColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: getProportionalHeight(50),
              width: getProportionalWidth(50),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionalWidth(10)!),
              child: Text(
                locationTitle,
                style:
                    TextStyle(color: kTextColor3, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
