import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LiveLocationServices {
  void getUserLocation(
      {LatLng locationPosition, void Function(LatLng) locationChanges}) async {
    bool _serviceEnabled;
    Location _location = new Location();
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();

      if (!!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      locationPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);

      locationChanges(locationPosition);
    });
  }
}
