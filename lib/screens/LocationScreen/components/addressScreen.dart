import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/screens/HomeScreen/homeScreen.dart';
import 'package:rise_real_estate/screens/NavigationScreen/NavigationScreen.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class AddressMapScreen extends StatefulWidget {
  const AddressMapScreen({Key? key}) : super(key: key);
  static String routeName = '/addressMapScreen';

  @override
  State<AddressMapScreen> createState() => _AddresMapsScreenState();
}

class _AddresMapsScreenState extends State<AddressMapScreen> {
  late LatLng latlng;
  String address = '';

  Completer<GoogleMapController> _mapController = Completer();

  List<Marker> _markers = [];

  Future<void> getAddressFromCoordinates(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    print(placemarks);
    address =
        '${placemarks[1].name} ${placemarks[0].thoroughfare} ${placemarks[1].subAdministrativeArea} ${placemarks[1].administrativeArea}, ${placemarks[1].country}';
  }

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    latlng = LatLng(args['lat'], args['lng']);
    address = args['address'];
    print('custom address'+address);
    Marker currentMarker = Marker(
        markerId: MarkerId('currentMarker'),
        position: LatLng(latlng.latitude, latlng.longitude));

    _markers.clear();

    _markers.add(currentMarker);

    final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(latlng.latitude, latlng.longitude),
      zoom: 18.4746,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          child: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            markers: _markers.toSet(),
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
        ),
        Positioned(
          top: getProportionalHeight(45),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionalWidth(10)!),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: getProportionalWidth(50),
                height: getProportionalHeight(50),
                decoration: BoxDecoration(
                    color: kSearchFieldColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                          color: Colors.black.withOpacity(0.3))
                    ]),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: getProportionalWidth(20),
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: getProportionalHeight(30),
          left: getProportionalWidth(-2),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionalWidth(10)!),
                  margin: EdgeInsets.all(getProportionalHeight(25)!),
                  width: getProportionalWidth(330),
                  height: getProportionalHeight(150),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: Offset(-3, 3),
                            color: Colors.black.withOpacity(0.1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location Detail",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: kTextColor3,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getProportionalHeight(7)!),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: getProportionalHeight(10)!),
                              width: getProportionalWidth(50),
                              height: getProportionalHeight(50),
                              decoration: BoxDecoration(
                                color: kSearchFieldColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.location_on_outlined,
                                size: getProportionalHeight(22),
                                color: Colors.black38,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: getProportionalWidth(2)!),
                                child: Text(
                                  address,
                                  // textAlign: TextAlign.left,
                                  // style: TextStyle(overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Next",
                    press: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          NavigationScreen.routeName, ModalRoute.withName('/'));
                    },
                    Height: getProportionalHeight(70)!,
                    Width: getProportionalWidth(300)!,
                    IconsSrc: "")
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
