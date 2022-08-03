import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/components/customFeaturedImageWidget.dart';
import 'package:rise_real_estate/components/header.dart';
import 'package:rise_real_estate/screens/AgentScreen/agentScreen.dart';
import 'package:rise_real_estate/screens/HomeScreen/components/body.dart';
import 'package:rise_real_estate/screens/PropertyDetailScreen/PropertyDetailScreen.dart';
import 'package:rise_real_estate/screens/TopLocation%20Screen/TopLocationScreen.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../components/categoryButton.dart';
import '../../components/customPropertyCard.dart';
import '../../components/customSaleBanner.dart';
import '../../components/customSearchField.dart';
import '../../components/featuredEstateCard.dart';
import '../../components/sectionHeading.dart';
import '../../components/topLocationCard.dart';
import '../../utils/data.dart';
import '../AgentDetailScreen/AgentDetailScreen.dart';
import '../FeaturedEstateScreen/FeaturedEstateScreen.dart';
import '../SingleLocationScreen/SingleLocationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: size.height - (size.height - 280),
            width: size.width,
            // width: double.infinity,
            // color: Colors.red,
            child: Stack(
              children: [
                Positioned(
                  right: getProportionalWidth(200),
                  bottom: getProportionalHeight(100),
                  child: Container(
                    height: getProportionalHeight(270),
                    width: getProportionalWidth(270),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        // borderRadius: BorderRadius.circular(100),
                        shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  width: size.width,
                  top: getProportionalHeight(45),
                  child: Header(),
                ),
                Positioned(
                  top: getProportionalHeight(100),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionalWidth(10)!),
                    child: Text.rich(
                      TextSpan(
                        text: "Hey,",
                        children: [
                          TextSpan(
                            text: "John!\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Let's start exploring",
                            style: TextStyle(
                              fontSize: getProportionalWidth(20),
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                          color: kTextColor3,
                          fontSize: getProportionalHeight(25)),
                    ),
                  ),
                ),
                Positioned(
                  top: getProportionalHeight(200),
                  width: size.width,
                  child: CustomeSearchField(
                      controller: _searchTextEditingController),
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: getProportionalWidth(25)!),
            height: getProportionalHeight(60),
            width: size.width,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: getProportionalWidth(10)!),
                    child: CategoryButton(
                      text: categoryData[index]['category']!,
                      isSelected: categoryData[index]['isSelected'],
                      width: 50,
                      height: 7,
                    ),
                  );
                })),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Container(
            height: getProportionalHeight(250),
            // width: getProportionalWidth(inputWidth),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CustomSaleBanner(
                  discountText: "All discount upto 60%",
                  saleText: "Halloween",
                  imageSrc: "assets/images/Halloween Sale.jpg",
                  press: () {},
                );
              },
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          SectionHeading(
            secttionTitle: "Featured Estates",
            sectionOptionName: "View All",
            titleSize: getProportionalWidth(20)!,
            isPadding: true,
            press: () {
              Navigator.push(
                context,
                PageTransition(
                    child: FeaturedEstateScreen(),
                    type: PageTransitionType.rightToLeft),
              );
            },
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Container(
            padding: EdgeInsets.only(left: getProportionalWidth(10)!),
            // margin: EdgeInsets.only(bottom: getProportionalHeight(10)!),
            height: getProportionalHeight(150),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return FeaturedEstateCard(
                  isShadow: false,
                );
              },
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          SectionHeading(
            secttionTitle: "Top Location",
            sectionOptionName: "explore",
            titleSize: getProportionalWidth(20)!,
            isPadding: true,
            press: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: TopLocationScreen(),
                      type: PageTransitionType.rightToLeft));
            },
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          // Container(
          //   height: getProportionalHeight(70),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: topLocationData.length,
          //     itemBuilder: (context, index) {
          //       return TopLocationCard();
          //     },
          //   ),
          // ),
          Container(
            height: getProportionalHeight(80),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: topLocationData.length,
              itemBuilder: (context, index) {
                return TopLocationCard(
                  locationTitle: topLocationData[index]['locationName'],
                  imageSrc: topLocationData[index]['imageSrc'],
                  press: () {
                    Navigator.of(context).pushNamed(
                      LocationDetailScreen.routeName,
                      arguments: <String, dynamic>{
                        "locationName": topLocationData[index]['locationName'],
                        "imageSrc": topLocationData[index]['imageSrc'],
                      },
                    );
                  },
                );
              },
            ),
          ),

          SizedBox(
            height: getProportionalHeight(20),
          ),
          Column(
            children: [
              SectionHeading(
                secttionTitle: "Top Estate Agent",
                sectionOptionName: "explore",
                titleSize: getProportionalWidth(20)!,
                isPadding: true,
                press: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: AgentsScreen(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              SizedBox(
                height: getProportionalHeight(100),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: topAgentData.length,
                  itemBuilder: (context, index) {
                    return TopAgentCard(
                      agentName: topAgentData[index]['agentName']!,
                      imageSrc: topAgentData[index]['imageSrc']!,
                      press: () {
                        Navigator.of(context).pushNamed(
                          AgentDetailScreen.routeName,
                          arguments: <String, dynamic>{
                            "agentName": topAgentData[index]['agentName'],
                            "imageSrc": topAgentData[index]['imageSrc'],
                            "sold": "112",
                            "rating": "4.8",
                            "reviews": "235"
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Wrap(
            children: [
              SectionHeading(
                secttionTitle: "Explore Nearby Estate",
                sectionOptionName: "",
                titleSize: getProportionalWidth(20)!,
                isPadding: true,
                press: () {},
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: topLocationData.length,
                  itemBuilder: (context, index) {
                    return customPropertyCard(
                      press: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: PropertyDetailScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}

class TopAgentCard extends StatelessWidget {
  const TopAgentCard({
    Key? key,
    required this.agentName,
    required this.imageSrc,
    required this.press,
  }) : super(key: key);
  final String agentName;
  final String imageSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
              height: getProportionalHeight(60),
              width: getProportionalWidth(60),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kHeadingColor,
                border: Border.all(width: 3, color: kTextColor3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: getProportionalHeight(2),
            ),
            Text(
              agentName,
              style: TextStyle(color: kTextColor3, overflow: TextOverflow.fade),
            ),
          ],
        ),
      ),
    );
  }
}
