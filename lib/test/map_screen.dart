import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_reward_user/model/Store.dart';
import 'package:your_reward_user/styles/h_colors.dart';

class GoogleMapScreen extends StatefulWidget {
  Store _store;

  GoogleMapScreen({Store store}) {
    this._store = store;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;
  GoogleMapController mapController;

  Future _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    mapController = controller;

    PermissionStatus permissionStatus = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    if (permissionStatus != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions([PermissionGroup.location]);
    }
  }

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("${widget._store.name}"),
          backgroundColor: HColors.lightBlueGrey,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black12,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(double.tryParse(widget._store.addressLat), double.tryParse(widget._store.addressLng)),
                zoom: 11.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 10, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.home),
                  color: Colors.red,
                  onPressed: () {
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            zoom: 11.0,
                            target: LatLng(
                                double.tryParse(widget._store.addressLat), double.tryParse(widget._store.addressLng))),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        if (markers.containsKey(selectedMarker)) {
          final Marker resetOld = markers[selectedMarker].copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[selectedMarker] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
        );
        markers[markerId] = newMarker;
      });
    }
  }

  void _addMarker() {
    _markerIdCounter++;
    final MarkerId markerId = MarkerId("");

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        double.tryParse(widget._store.addressLat) + sin(_markerIdCounter * pi / 6.0) / 20.0,
        double.tryParse(widget._store.addressLng) + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: widget._store.name, snippet: widget._store.address),
      onTap: () {
        _onMarkerTapped(markerId);
      },
    );

    setState(() {
      markers[markerId] = marker;
    });
  }
}
