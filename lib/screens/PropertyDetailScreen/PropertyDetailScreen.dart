import 'package:flutter/material.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../../components/customBackButton.dart';
import '../../utils/size_config.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key}) : super(key: key);
  static String routeName = "property-Detail-Screen";

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: getProportionalHeight(500),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset(
                    "assets/images/home Apartment.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: getProportionalHeight(45),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(
                            icon: Icons.arrow_back_ios_new_outlined,
                            iconColor: Colors.black54),
                        SizedBox(
                          width: getProportionalWidth(110),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomBackButton(
                                  icon: Icons.favorite_rounded,
                                  iconColor: Colors.green),
                              CustomBackButton(
                                icon: Icons.exit_to_app_outlined,
                                iconColor: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: getProportionalHeight(410),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: getProportionalWidth(15)!),
                      // height: getProportionalHeight(60),
                      // width: getProportionalWidth(100),
                      constraints: BoxConstraints(
                          minHeight: getProportionalHeight(60)!,
                          maxWidth: getProportionalWidth(100)!),
                      decoration: BoxDecoration(
                        color: kHeadingColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "⭐",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getProportionalWidth(20),
                            ),
                          ),
                          Text(
                            "4.9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionalWidth(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getProportionalWidth(15)!),
                      // height: getProportionalHeight(60),
                      // width: getProportionalWidth(100),
                      constraints: BoxConstraints(
                          minHeight: getProportionalHeight(60)!,
                          minWidth: getProportionalWidth(100)!),
                      decoration: BoxDecoration(
                        color: kHeadingColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Apartment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionalWidth(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Wings Tower",
                          style: TextStyle(
                              color: kHeadingColor,
                              fontSize: getProportionalWidth(22),
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: kHeadingColor,
                              size: getProportionalWidth(16),
                            ),
                            Text(
                              " Lahore, Pakistan",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "\$ 200",
                          style: TextStyle(
                            color: kHeadingColor,
                            fontSize: getProportionalWidth(20),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "per month",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            child: Row(
              children: [
                CustomBuyRentButton(
                  text: "Rent",
                  press: () {},
                ),
                SizedBox(
                  width: getProportionalWidth(20),
                ),
                CustomBuyRentButton(
                  text: "Buy",
                  press: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionalWidth(20)!,
                vertical: getProportionalHeight(20)!),
            child: Divider(
              thickness: 2,
              color: kSearchFieldColor,
            ),
          ),
          SizedBox(
            height: getProportionalHeight(5),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
            padding: EdgeInsets.all(getProportionalWidth(10)!),
            width: double.infinity,
            height: getProportionalHeight(80),
            decoration: BoxDecoration(
              color: kSearchFieldColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   height: getProportionalHeight(45),
                //   width: getProportionalWidth(45),
                //   decoration: BoxDecoration(
                //     color: kHeadingColor,
                //     shape: BoxShape.circle,
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(100),
                //     child: Image.asset(
                //       "assets/images/agent 1.jpg",
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // )
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: kHeadingColor, width: 2.5),
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/agent 2.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: getProportionalWidth(5),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anderson",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kHeadingColor,
                              fontSize: getProportionalWidth(16)),
                        ),
                        Text(
                          "Real Estate Agent",
                          style: TextStyle(fontSize: getProportionalWidth(12)),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.message_rounded,
                  color: kHeadingColor,
                  size: getProportionalWidth(24),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Container(
            height: getProportionalHeight(80),
            // padding: EdgeInsets.all(getProportionalWidth(10)!),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PropertyFeaturesCard(),
                );
              },
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location & Public Facilities",
                  style: TextStyle(
                      color: kHeadingColor,
                      fontSize: getProportionalWidth(20),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      CustomBackButton(
                          icon: Icons.location_on_outlined,
                          iconColor: kHeadingColor),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(left: getProportionalWidth(10)!),
                          child: Text(
                            "Vterinary Rsearch Institue, Zarrar Shaheed Road,Lahore Cantt, Pakistan",
                            style: TextStyle(color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
        ],
      ),
    );
  }
}

class PropertyFeaturesCard extends StatelessWidget {
  const PropertyFeaturesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionalWidth(10)!),
      constraints: BoxConstraints(
          minHeight: getProportionalHeight(40)!,
          minWidth: getProportionalWidth(120)!),
      decoration: BoxDecoration(
          color: kSearchFieldColor, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Icon(
            Icons.bed_rounded,
            color: kPrimaryColor,
          ),
          Text.rich(
            TextSpan(
              text: "2",
              children: [
                TextSpan(text: " Bedrooms"),
              ],
            ),
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class CustomBuyRentButton extends StatelessWidget {
  const CustomBuyRentButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: getProportionalHeight(45),
      width: getProportionalWidth(70),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
