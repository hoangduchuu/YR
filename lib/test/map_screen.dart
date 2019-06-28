import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleMapScreen extends StatefulWidget {
  LatLng _location;
  GoogleMapScreen({LatLng location}){
    this._location = location;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  Future _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);

    PermissionStatus permissionStatus =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    if (permissionStatus != PermissionStatus.granted){
      Map<PermissionGroup, PermissionStatus> permissions = await
      PermissionHandler().requestPermissions([PermissionGroup.location]);
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
