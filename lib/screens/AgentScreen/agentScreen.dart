import 'package:flutter/material.dart';
import 'package:rise_real_estate/components/customBackButton.dart';
import 'package:rise_real_estate/components/sectionHeading.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/data.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../AgentDetailScreen/AgentDetailScreen.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);
  static String routeName = '/agent-screen';
  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getProportionalWidth(10)!,
                  top: getProportionalHeight(45)!),
              child: CustomBackButton(
                  icon: Icons.arrow_back_ios_new_outlined,
                  iconColor: Colors.black54),
            ),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          SectionHeading(
            secttionTitle: "Top Estate Agents",
            sectionOptionName: "",
            press: () {},
            isPadding: true,
            titleSize: getProportionalWidth(22)!,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Find the best estate agent to sell or buy property."),
          ),
          Wrap(
            children: [
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(getProportionalHeight(8)!),
                      child: CustomAgentCard(
                          agentName: topAgentData[index]['agentName']!,
                          imageSrc: topAgentData[index]['imageSrc']!,
                          noOfSold: "112",
                          rating: "4.8",
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
                          }),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}

class CustomAgentCard extends StatelessWidget {
  const CustomAgentCard({
    Key? key,
    required this.press,
    required this.agentName,
    required this.imageSrc,
    required this.rating,
    required this.noOfSold,
  }) : super(key: key);
  final VoidCallback press;
  final String agentName;
  final String imageSrc;
  final String rating;
  final String noOfSold;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getProportionalHeight(220),
        width: getProportionalWidth(160),
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionalWidth(10)!),
              child: Container(
                height: getProportionalHeight(110),
                width: getProportionalHeight(110),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kHeadingColor,
                  border: Border.all(color: kTextColor1, width: 3),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      imageSrc,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            // SizedBox(
            //   height: getProportionalHeight(10),
            // ),
            Text(
              agentName,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(color: kTextColor2, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionalHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(children: [
                    Text("⭐"),
                    Text("4.9"),
                  ]),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: kHeadingColor,
                        size: 16,
                      ),
                      Text(
                        " 112",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionalWidth(14)),
                      ),
                      Text(
                        " Sold",
                        style: TextStyle(fontSize: getProportionalWidth(12)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
