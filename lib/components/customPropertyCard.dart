import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class customPropertyCard extends StatelessWidget {
  const customPropertyCard({
    Key? key, required this.press,
  }) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getProportionalHeight(260),
              width: getProportionalWidth(160),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(getProportionalWidth(8)!),
                    height: getProportionalHeight(175),
                    width: double.infinity,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: NearByImageWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionalWidth(5)!),
                    child: Text(
                      "Wings Tower",
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: TextStyle(
                          color: kTextColor2, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: getProportionalHeight(5),
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
                    height: getProportionalHeight(5),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NearByImageWidget extends StatelessWidget {
  const NearByImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionalWidth(5)!),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage("assets/images/home Apartment.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(getProportionalWidth(8)!),
                height: getProportionalWidth(30),
                width: getProportionalWidth(30),
                decoration: BoxDecoration(
                    color: Colors.green[400], shape: BoxShape.circle),
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
            Container(
              margin: EdgeInsets.all(getProportionalWidth(8)!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(getProportionalWidth(3)!),
                      // height: 30,
                      // width: 80,
                      constraints: BoxConstraints(
                        maxHeight: getProportionalHeight(30)!,
                        maxWidth: getProportionalWidth(80)!,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: kTextColor3.withOpacity(0.9),
                      ),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text.rich(
                            TextSpan(
                              text: "\$ ",
                              children: [
                                TextSpan(text: "250"),
                                TextSpan(text: "/"),
                                TextSpan(
                                  text: "month",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}