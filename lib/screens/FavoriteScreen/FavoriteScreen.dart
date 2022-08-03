import 'package:flutter/material.dart';
import 'package:rise_real_estate/components/customBackButton.dart';
import 'package:rise_real_estate/components/featuredEstateCard.dart';
import 'package:rise_real_estate/screens/HomeScreen/homeScreen.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  static String routeName = '/favorite-screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: getProportionalHeight(45),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: getProportionalHeight(40),
              child: Text(
                "My Favorite",
                style: TextStyle(
                  color: kHeadingColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionalWidth(18),
                ),
              ),
            ),
            SizedBox(
              height: getProportionalHeight(5),
            ),
            Text(
              "3 Estates",
              style: TextStyle(
                fontSize: getProportionalWidth(18),
                fontWeight: FontWeight.bold,
                color: kHeadingColor,
              ),
            ),
            SizedBox(
              height: getProportionalHeight(10),
            ),
            Wrap(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.only(bottom: getProportionalHeight(15)!),
                      child: FeaturedEstateCard(
                        isShadow: true,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
