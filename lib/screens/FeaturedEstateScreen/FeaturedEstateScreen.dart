import 'package:flutter/material.dart';

import '../../components/customBackButton.dart';
import '../../components/featuredEstateCard.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class FeaturedEstateScreen extends StatefulWidget {
  const FeaturedEstateScreen({Key? key}) : super(key: key);
  static String routeName = '/featured-estate-screen';

  @override
  State<FeaturedEstateScreen> createState() => _FeaturedEstateScreenState();
}

class _FeaturedEstateScreenState extends State<FeaturedEstateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height -
                    getProportionalHeight(570)!,
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
              Positioned(
                top: getProportionalHeight(45),
                left: getProportionalWidth(20),
                child:
                    CustomBackButton(icon: Icons.arrow_back_ios_new_outlined,iconColor: Colors.black54),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(
              TextSpan(
                text: "Found ",
                children: [
                  TextSpan(
                    text: "128",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " estates",
                  ),
                ],
              ),
              style: TextStyle(
                color: kHeadingColor,
                fontSize: getProportionalWidth(18),
              ),
            ),
          ),
          Wrap(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionalWidth(10)!,
                        vertical: getProportionalHeight(10)!),
                    child: FeaturedEstateCard(isShadow: true),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
