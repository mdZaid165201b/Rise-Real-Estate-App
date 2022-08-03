import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class CustomFeaturedImageWidget extends StatefulWidget {
  const CustomFeaturedImageWidget({Key? key}) : super(key: key);

  @override
  State<CustomFeaturedImageWidget> createState() =>
      _CustomFeaturedImageStateWidget();
}

class _CustomFeaturedImageStateWidget extends State<CustomFeaturedImageWidget> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(getProportionalWidth(3)!),
                      // height: 30,
                      // width: 80,
                      constraints: BoxConstraints(
                          maxHeight: getProportionalHeight(25)!,
                          maxWidth: getProportionalWidth(60)!),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        color: kTextColor3.withOpacity(0.9),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Apartment",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
