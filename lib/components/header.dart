import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../utils/size_config.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionalWidth(8)!,
      ),
      // width: double.infinity,
      // height: getProportionalHeight(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            width: getProportionalWidth(145),
            height: getProportionalHeight(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                // color: Colors.grey.withOpacity(0.1),
                color: Colors.white),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: Icon(Icons.location_on_rounded,
                      size: 20, color: kHeadingColor),
                ),
                Expanded(
                    child: Text(
                  "Lahore, Pakistan",
                  style: TextStyle(fontSize: 10, color: kHeadingColor),
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              // width: getProportionalWidth(145),
              height: getProportionalHeight(50),
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Container(
                    width: getProportionalWidth(45),
                    height: getProportionalHeight(45),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 2, color: kPrimaryColor)),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: getProportionalWidth(6),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: getProportionalWidth(45),
                      height: getProportionalHeight(45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Container(
                          width: getProportionalWidth(45),
                          height: getProportionalHeight(45),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(width: 0, color: kPrimaryColor)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Image.asset(
                              "assets/images/profile.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: getProportionalWidth(42),
                      //   height: getProportionalHeight(42),
                      //   decoration: BoxDecoration(
                      //       color: Colors.black54, shape: BoxShape.circle),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(100),
                      //     child: Image.asset(
                      //       "assets/images/profile.jpg",
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
