import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rise_real_estate/components/customButton.dart';
import 'package:rise_real_estate/screens/LocationScreen/components/addressScreen.dart';
import 'package:rise_real_estate/utils/size_config.dart';

import '../../../utils/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

Completer<GoogleMapController> _mapController = Completer();
final CameraPosition _initialCameraPosition = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

late LatLng latLng;
String address = '';

List<Marker> _markers = [
  Marker(
      markerId: MarkerId("initialMarker"),
      position: LatLng(37.42796133580664, -122.085749655962))
];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    
    
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(top: getProportionalHeight(100)!),
            padding: EdgeInsets.only(
                // top: getProportionalHeight(30)!,
                left: getProportionalWidth(20)!,
                right: getProportionalWidth(20)!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionalHeight(25),
                ),
                Text.rich(
                  TextSpan(
                    text: "Add your ",
                    children: [
                      TextSpan(
                          text: 'location',
                          style: TextStyle(
                              color: kHeadingColor,
                              fontWeight: FontWeight.bold))
                    ],
                    style: TextStyle(
                        fontSize: getProportionalWidth(24),
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: getProportionalHeight(20),
                ),
                Text(
                  "you can edit this later on your account setting",
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            // color: Colors.red,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                left: getProportionalWidth(22),
                top: getProportionalHeight(60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: getProportionalWidth(60)!),
                    alignment: Alignment.center,
                    height: getProportionalHeight(300),
                    width: getProportionalWidth(330),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      // border: Border.all(color: kPrimaryColor,width: 3)
                    ),
                    child: GoogleMap(
                      // myLocationEnabled: true,
                      mapType: MapType.normal,
                      markers: _markers.toSet(),
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionalHeight(60),
              ),
              Positioned(
                  top: getProportionalHeight(480),
                  left: getProportionalWidth(35),
                  child: CustomButton(
                      text: "Choose your Location",
                      press: () async {
                        await getCurrentPosition();
                        await getAddressFromCoordinates(latLng);
                        // print("Custom Address   " + address);
                        setState(() {});
                        // print(latLng.latitude.toString() + " Custom Latitude");
                        
                        Navigator.pushNamed(context, AddressMapScreen.routeName,
                            arguments: 
                            <String, dynamic>{
                              "lat": latLng.latitude,
                              "lng": latLng.longitude,
                              "address": address
                            }
                            );
                        // Position? position = await _determinePosition();

                        // final GoogleMapController controller =
                        //     await _mapController.future;

                        // controller.animateCamera(
                        //   CameraUpdate.newCameraPosition(
                        //     CameraPosition(
                        //       zoom: 18,
                        //       target: LatLng(
                        //           position!.latitude, position.longitude),
                        //     ),
                        //   ),
                        // );
                        // _markers.clear();
                        // _markers.add(Marker(
                        //   markerId: MarkerId("currentMarker"),
                        //   position:
                        //       LatLng(position.latitude, position.longitude),
                        // ));
                        // setState(() {});
                      },
                      Height: getProportionalHeight(70)!,
                      Width: getProportionalWidth(300)!,
                      IconsSrc: ""))
            ]),
          ),
        ),
      ],
    );
  }
}
Future<void> getAddressFromCoordinates(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    print(placemarks[0]);
    print("Custom Address");
    print(placemarks[1]);
     address = '${placemarks[0].name} ${placemarks[0].thoroughfare} ${placemarks[1].subAdministrativeArea} ${placemarks[1].administrativeArea}, ${placemarks[1].country}';
     print("Custom Address");

  }
Future<void> getCurrentPosition() async {
  Position? position = await _determinePosition();

  final GoogleMapController controller = await _mapController.future;

  controller.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(
        zoom: 18,
        target: LatLng(position!.latitude, position.longitude),
      ),
    ),
  );
  _markers.clear();
  _markers.add(Marker(
    markerId: MarkerId("currentMarker"),
    position: LatLng(position.latitude, position.longitude),
  ));
}

Future<Position>? _determinePosition() async {
  bool isServiceEnabled;
  LocationPermission permission;
  isServiceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isServiceEnabled) {
    return Future.error("Location Service disabled");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Location Service disabled!!!");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location Service Disabled forever!!!");
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  latLng = LatLng(position.latitude, position.longitude);
  return position;
}
