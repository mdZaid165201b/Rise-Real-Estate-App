import 'package:flutter/material.dart';
import 'package:rise_real_estate/components/customBackButton.dart';
import 'package:rise_real_estate/components/customSearchField.dart';
import 'package:rise_real_estate/components/featuredEstateCard.dart';
import 'package:rise_real_estate/components/sectionHeading.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({Key? key}) : super(key: key);
  static String routeName = '/single-location-screen';

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(args);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: getProportionalHeight(300),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset(
                    args['imageSrc'],
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
          SizedBox(
            height: getProportionalHeight(20),
          ),
          SectionHeading(
            secttionTitle: args['locationName'],
            sectionOptionName: "",
            titleSize: getProportionalWidth(30)!,
            press: () {},
            isPadding: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Our recommended real estates in Maldives"),
          ),
          SizedBox(
            height: getProportionalHeight(20),
          ),
          CustomeSearchField(controller: _searchTextEditingController),
          SizedBox(
            height: getProportionalHeight(20),
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
