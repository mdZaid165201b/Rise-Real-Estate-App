import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise_real_estate/components/customBackButton.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/utils/constants.dart';

import '../../components/customPropertyCard.dart';
import '../../components/sectionHeading.dart';
import '../../utils/data.dart';
import '../../utils/size_config.dart';

class AgentDetailScreen extends StatefulWidget {
  const AgentDetailScreen({Key? key}) : super(key: key);
  static String routeName = '/single-route-screen';

  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  final ValueNotifier<bool> _listingTabNotifier = ValueNotifier(true);
  final ValueNotifier<bool> _soldTabNotifier = ValueNotifier(false);
  @override
  void dispose() {
    _listingTabNotifier.dispose();
    _soldTabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Buil Method Called");
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double doubleRating = double.parse(args['rating']);
    int rating = doubleRating.toInt();

    print(rating);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {},
        label: Text(
          "Start Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getProportionalHeight(40)!),
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                      icon: Icons.arrow_back_ios_new_outlined,
                      iconColor: Colors.black54),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: kTextColor2, fontSize: getProportionalWidth(20)),
                  ),
                  CustomBackButton(
                    icon: Icons.exit_to_app,
                    iconColor: Colors.black54,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          Column(
            children: [
              Text(
                args['agentName'],
                style: TextStyle(
                    color: kTextColor2,
                    fontSize: getProportionalWidth(22),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionalHeight(10),
              ),
              Text(
                "muhammadzaidabcd@gmail.com",
                style: TextStyle(
                  color: kHeadingColor.withOpacity(0.6),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              Container(
                height: getProportionalHeight(130),
                width: getProportionalHeight(130),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: kHeadingColor, width: 3),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    args["imageSrc"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(10),
              ),
              Container(
                height: getProportionalHeight(150),
                padding: EdgeInsets.all(getProportionalHeight(10)!),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    agentDetailCard(
                        arg: args['rating'],
                        rating: rating,
                        isStars: true,
                        text: ""),
                    agentDetailCard(
                        arg: "235",
                        rating: rating,
                        isStars: false,
                        text: "Reviews"),
                    agentDetailCard(
                        arg: args['sold'],
                        rating: rating,
                        isStars: false,
                        text: "Sold"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(getProportionalWidth(20)!),
                margin:
                    EdgeInsets.symmetric(horizontal: getProportionalWidth(20)!),
                width: double.infinity,
                height: getProportionalHeight(80),
                decoration: BoxDecoration(
                  color: kSearchFieldColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _listingTabNotifier.value = true;
                          _soldTabNotifier.value = false;
                        },
                        child: ValueListenableBuilder(
                          valueListenable: _listingTabNotifier,
                          builder:
                              (BuildContext context, bool val, Widget? child) {
                            if (val) {
                              return ListingTab(
                                tabColor: kHeadingColor,
                                textColor: Colors.white,
                              );
                            } else {
                              return ListingTab(
                                  tabColor: kSearchFieldColor,
                                  textColor: Colors.black);
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _listingTabNotifier.value = false;
                        _soldTabNotifier.value = true;
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _soldTabNotifier,
                        builder:
                            (BuildContext context, bool val, Widget? child) {
                          if (val) {
                            return SoldTab(
                              tabColor: kHeadingColor,
                              textColor: Colors.white,
                            );
                          } else {
                            return SoldTab(
                                tabColor: kSearchFieldColor,
                                textColor: Colors.black);
                          }
                        },
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionalHeight(10),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionalWidth(10)!),
            child: Text.rich(
              TextSpan(
                text: "140",
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: " listings"),
                ],
              ),
              style: TextStyle(fontSize: getProportionalWidth(20)),
            ),
          ),
          Wrap(
            children: [
              SizedBox(
                height: getProportionalHeight(20),
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: topLocationData.length,
                  itemBuilder: (context, index) {
                    return customPropertyCard(
                      press: () {},
                    );
                  })
            ],
          )
        ],
      ),
    );
  }

  Container agentDetailCard(
      {required String arg,
      required int rating,
      required bool isStars,
      required String text}) {
    return Container(
      height: getProportionalHeight(80),
      width: getProportionalWidth(110),
      decoration: BoxDecoration(
        color: kSearchFieldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            arg,
            style: TextStyle(
                color: kTextColor2,
                fontSize: getProportionalWidth(20),
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: getProportionalWidth(5)!),
            child: isStars
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      rating,
                      (index) => Text(
                        "⭐",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionalWidth(14),
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}

class SoldTab extends StatelessWidget {
  const SoldTab({
    Key? key,
    required this.tabColor,
    required this.textColor,
  }) : super(key: key);

  final Color tabColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(5)!),
      alignment: Alignment.center,
      height: getProportionalHeight(50),
      decoration: BoxDecoration(
        color: tabColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        "Sold",
        style: TextStyle(
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ListingTab extends StatelessWidget {
  const ListingTab({
    Key? key,
    required this.tabColor,
    required this.textColor,
  }) : super(key: key);
  final Color tabColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionalWidth(5)!),
      alignment: Alignment.center,
      height: getProportionalHeight(50),
      decoration: BoxDecoration(
        color: tabColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        "Listings",
        style: TextStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
