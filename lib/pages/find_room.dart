import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class FindRoomInfo extends StatefulWidget {
  @override
  _FindRoomInfoState createState() => _FindRoomInfoState();
}

class _FindRoomInfoState extends State<FindRoomInfo> {
  Position _currentPosition;
  String _currentAddress;

  Future<Position> position = Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('asdsasd///////////////${position.latitude}');
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PlatformMap(
          initialCameraPosition: CameraPosition(
            target: const LatLng(47.6, 8.8796),
            zoom: 16.0,
          ),
          markers: Set<Marker>.of(
            [
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(47.6, 8.8796),
                consumeTapEvents: true,
                infoWindow: InfoWindow(
                  title: 'PlatformMarker',
                  snippet: "Hi I'm a Platform Marker",
                ),
                onTap: () {
                  print("Marker tapped");
                },
              ),
            ],
          ),
          mapType: MapType.normal,
          onTap: (location) => print('onTap: $location'),
          onCameraMove: (cameraUpdate) => print('onCameraMove: $cameraUpdate'),
          compassEnabled: true,
          onMapCreated: (controller) {
            Future.delayed(Duration(seconds: 2)).then(
                  (_) {
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    const CameraPosition(
                      bearing: 270.0,
                      target: LatLng(47.6, 8.8796),
                      tilt: 30.0,
                      zoom: 18,
                    ),
                  ),
                );
                controller.getVisibleRegion().then(
                  (bounds) => print("bounds: ${bounds.toString()}")
                );
              },
            );
          },
        ),
      ),
    );
  }
}