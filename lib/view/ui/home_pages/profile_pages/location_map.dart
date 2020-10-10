import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t3t3/view/ui/screen_util.dart';

class LocationMap extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String address;
  final bool editing;
  final Function(double, double) onLocationSpecifiedOnMap;

  LocationMap(
      {@required this.latitude,
      @required this.longitude,
      @required this.address,
      this.editing = false,
      this.onLocationSpecifiedOnMap});

  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  ScreenUtil _screenUtil = ScreenUtil();

  Completer<GoogleMapController> _controller = Completer();

  final Map<String, Marker> _markers = {};

  _test() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print('${position.latitude}, ${position.longitude}');
  }

  @override
  void initState() {
    final marker = Marker(
      markerId: MarkerId('Address Location'),
      position: LatLng(widget.latitude, widget.longitude),
      infoWindow: InfoWindow(
        title: 'Address Location',
        snippet: widget.address,
      ),
    );
    _markers['Address Location'] = marker;
    _test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return new Scaffold(
      body: Column(
        children: [
          widget.editing ? Container(
            alignment: Alignment.center,
            height: _screenUtil.setHeight(200),
            color: Colors.white,
            child: Text('Specify Your Address Location'),
          ) : Container(),
          Expanded(
            child: GoogleMap(
              onTap: (position) {
                if (widget.editing) {
                  final marker = Marker(
                    markerId: MarkerId('Address Location'),
                    position: LatLng(position.latitude, position.longitude),
                    infoWindow: InfoWindow(
                      title: 'Address Location',
                      snippet: widget.address,
                    ),

                  );
                  setState(() {
                    _markers['Address Location'] = marker;
                  });
                  if (widget.onLocationSpecifiedOnMap != null) {
                    widget.onLocationSpecifiedOnMap(
                        position.latitude, position.longitude);
                  }
                }
              },
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.latitude, widget.longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers.values.toSet(),
            ),
          ),
        ],
      ),
    );
  }
}
