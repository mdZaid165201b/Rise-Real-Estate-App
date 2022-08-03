import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../../utils/constants.dart';

class TopLocationCard extends StatelessWidget {
  const TopLocationCard({
    Key? key,
    required this.locationName,
    required this.imageSrc,
    required this.press,
  }) : super(key: key);
  final String locationName;
  final String imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getProportionalHeight(230),
            width: getProportionalWidth(160),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.all(getProportionalWidth(8)!),
                  height: getProportionalHeight(175),
                  width: double.infinity,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(getProportionalWidth(5)!),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(imageSrc), fit: BoxFit.cover),
                      ),
                      child: Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin:
                                    EdgeInsets.all(getProportionalWidth(8)!),
                                height: getProportionalWidth(30),
                                width: getProportionalWidth(30),
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: getProportionalWidth(14),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionalWidth(5)!),
                  child: Text(
                    locationName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: TextStyle(
                        color: kTextColor2, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
