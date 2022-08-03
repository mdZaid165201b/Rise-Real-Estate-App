import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';
import 'customFeaturedImageWidget.dart';

class FeaturedEstateCard extends StatelessWidget {
  const FeaturedEstateCard({
    Key? key,
    required this.isShadow,
  }) : super(key: key);
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return isShadow
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(-5, 0.2),
                ),
              ],
            ),
            child: simpleFeaturedEstateCard(),
          )
        : simpleFeaturedEstateCard();
  }
}

class simpleFeaturedEstateCard extends StatelessWidget {
  const simpleFeaturedEstateCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: getProportionalHeight(150),
        width: getProportionalWidth(300),
        margin: EdgeInsets.only(right: getProportionalWidth(8)!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kSearchFieldColor,
          
        ),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: CustomFeaturedImageWidget(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionalWidth(8)!,
                  vertical: getProportionalHeight(8)!),
              child: Column(
                children: [
                  Text(
                    "Sky Dandleions Apartment",
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: TextStyle(
                        color: kTextColor2, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionalHeight(3),
                  ),
                  Row(
                    children: [
                      Text("⭐"),
                      Text(
                        "4.9",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionalHeight(3),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: getProportionalWidth(15),
                        color: kTextColor3,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Lahore",
                          children: [
                            TextSpan(text: ", "),
                            TextSpan(text: "Pakistan"),
                          ],
                        ),
                        style: TextStyle(fontSize: getProportionalWidth(13)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionalHeight(5),
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "\$ ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionalWidth(17)),
                          children: [
                            TextSpan(
                              text: "250",
                              style: TextStyle(
                                  fontSize: getProportionalWidth(17),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "/month",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        style: TextStyle(color: kTextColor3),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
