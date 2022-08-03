import 'package:flutter/material.dart';
import 'package:rise_real_estate/screens/FavoriteScreen/FavoriteScreen.dart';
import 'package:rise_real_estate/screens/HomeScreen/homeScreen.dart';
import 'package:rise_real_estate/screens/ProfileScreen/ProfileScreen.dart';
import 'package:rise_real_estate/utils/constants.dart';
import 'package:rise_real_estate/utils/size_config.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);
  static String routeName = '/navigation-screen';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 5,
                  color: Colors.black38.withOpacity(0.1))
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.transparent),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getProportionalWidth(30)!),
            topRight: Radius.circular(getProportionalWidth(30)!),
          ),
          child: BottomNavigationBar(
            elevation: 10,
            selectedItemColor: kHeadingColor,
            backgroundColor: Colors.white,
            onTap: (value) {
              setState(() {
                print(value);
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_sharp,
                    color: currentIndex == 0 ? kTextColor2 : Colors.black54,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: currentIndex == 1 ? kTextColor2 : Colors.black54,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: currentIndex == 1 ? kTextColor2 : Colors.black54,
                  ),
                  label: ""),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
