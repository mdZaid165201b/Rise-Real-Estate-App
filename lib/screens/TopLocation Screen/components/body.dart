import 'package:flutter/material.dart';
import 'package:rise_real_estate/components/sectionHeading.dart';
import 'package:rise_real_estate/screens/SingleLocationScreen/SingleLocationScreen.dart';
import 'package:rise_real_estate/components/customBackButton.dart';
import 'package:rise_real_estate/screens/TopLocation%20Screen/components/topLocationCard.dart';

import '../../../utils/constants.dart';
import '../../../utils/data.dart';
import '../../../utils/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final List<Map<String, dynamic>> topLocationData = [
  //   {
  //     "locationName": "Lahore",
  //     "imageSrc": "assets/images/lahore.jpg",
  //   },
  //   {
  //     "locationName": "Islamabad",
  //     "imageSrc": "assets/images/islamabad.jpg",
  //   },
  //   {
  //     "locationName": "Karachi",
  //     "imageSrc": "assets/images/karachi.jpg",
  //   },
  //   {
  //     "locationName": "Multan",
  //     "imageSrc": "assets/images/multan.jpg",
  //   },
  //   {
  //     "locationName": "Maldive",
  //     "imageSrc": "assets/images/maldives.jpg",
  //   },
  //   {
  //     "locationName": "Semarang",
  //     "imageSrc": "assets/images/semarang.jpg",
  //   },
  //   {
  //     "locationName": "Bali",
  //     "imageSrc": "assets/images/bali.jpg",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: getProportionalHeight(0),
        ),
        Padding(
          padding: EdgeInsets.all(getProportionalHeight(8)!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(icon: Icons.arrow_back_ios_new_outlined,iconColor: Colors.black54),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              SectionHeading(
                secttionTitle: "Top Locations",
                sectionOptionName: "",
                isPadding: false,
                titleSize: getProportionalWidth(20)!,
                press: () {},
              ),
              Text(
                "Find the best recommendations place to live.",
                style: TextStyle(color: kTextColor3),
              ),
              SizedBox(
                height: getProportionalHeight(20),
              ),
              GridView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 5,
                ),
                itemCount: topLocationData.length,
                itemBuilder: (context, index) {
                  return TopLocationCard(
                    locationName: topLocationData[index]['locationName'],
                    imageSrc: topLocationData[index]['imageSrc'],
                    press: () {
                      Navigator.of(context).pushNamed(
                        LocationDetailScreen.routeName,
                        arguments: <String, dynamic>{
                          "locationName": topLocationData[index]
                              ['locationName'],
                          "imageSrc": topLocationData[index]['imageSrc'],
                        },
                        
                      );
                      print("Clicked !!!!!!!");
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
