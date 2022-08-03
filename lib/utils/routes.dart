import 'package:flutter/material.dart';
import 'package:rise_real_estate/components/featuredEstateCard.dart';
import 'package:rise_real_estate/screens/AgentScreen/agentScreen.dart';
import 'package:rise_real_estate/screens/FeaturedEstateScreen/FeaturedEstateScreen.dart';
import 'package:rise_real_estate/screens/HomeScreen/homeScreen.dart';
import 'package:rise_real_estate/screens/LocationScreen/LocationScreen.dart';
import 'package:rise_real_estate/screens/LocationScreen/components/addressScreen.dart';
import 'package:rise_real_estate/screens/LoginScreen/login_screen1.dart';
import 'package:rise_real_estate/screens/NavigationScreen/NavigationScreen.dart';
import 'package:rise_real_estate/screens/PropertyDetailScreen/PropertyDetailScreen.dart';
import 'package:rise_real_estate/screens/RegisterationScreen/registeration_screen.dart';
import 'package:rise_real_estate/screens/SingleLocationScreen/SingleLocationScreen.dart';
import 'package:rise_real_estate/screens/TopLocation%20Screen/TopLocationScreen.dart';
import 'package:rise_real_estate/screens/onboarding_screen/onBoarding_screen.dart';

import '../screens/AgentDetailScreen/AgentDetailScreen.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterationScreen.routeName: (context) => RegisterationScreen(),
  AddressMapScreen.routeName: (context) => AddressMapScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TopLocationScreen.routeName: (context) => LocationScreen(),
  LocationDetailScreen.routeName: (context) => LocationDetailScreen(),
  AgentsScreen.routeName: (context) => AgentsScreen(),
  AgentDetailScreen.routeName: (context) => AgentDetailScreen(),
  FeaturedEstateScreen.routeName: (context) => FeaturedEstateScreen(),
  PropertyDetailScreen.routeName: (context) => PropertyDetailScreen(),
  NavigationScreen.routeName: (context) => NavigationScreen(),
};
