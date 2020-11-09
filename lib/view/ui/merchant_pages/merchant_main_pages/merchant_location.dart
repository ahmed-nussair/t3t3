import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MerchantLocation extends StatefulWidget {
  @override
  _MerchantLocationState createState() => _MerchantLocationState();
}

class _MerchantLocationState extends State<MerchantLocation> {
  final Map<String, Marker> _markers = {
    "Nussair": Marker(
      markerId: MarkerId('Nussair'),
      position: LatLng(30.046421, 31.366645),
    )
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(30.046421, 31.366645),
        zoom: 17,
      ),
      markers: _markers.values.toSet(),
    );
  }
}
