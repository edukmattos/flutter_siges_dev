import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class ClientLocationPosition {
  final double latitude;
  final double longitude;
  final String address;

  ClientLocationPosition(
      {@required this.latitude,
      @required this.longitude,
      @required this.address});

  LatLng toLatLng() {
    return LatLng(this.latitude, this.longitude);
  }
}

class ClientLocation {
  final String id;
  final String clientId;
  final String description;
  final ClientLocationPosition position;
  final File imagePath;

  ClientLocation({
    @required this.id,
    @required this.clientId,
    @required this.description,
    @required this.position,
    this.imagePath
  })
}
