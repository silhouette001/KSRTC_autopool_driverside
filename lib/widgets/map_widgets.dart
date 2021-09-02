import 'dart:async';
import 'dart:developer';

import 'package:demo_current_location/services/liveLocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidgets extends StatefulWidget {
// * default location for map
  final bool isLiveLocation;

  MapWidgets({this.isLiveLocation});

  @override
  _MapWidgetsState createState() => _MapWidgetsState();
}

class _MapWidgetsState extends State<MapWidgets> {
  final LatLng _defaultLocation = LatLng(9.9816, 76.2999);
  final double _defaultZoomLevel = 18;
  final Completer<GoogleMapController> _mapController = Completer();
  final LiveLocationServices _locationServices = LiveLocationServices();

  void _onMapCreate(GoogleMapController _mapOnCreateController) {
    
    _mapController.complete(_mapOnCreateController);
  }

  Future<void> _camerMove(CameraPosition _cameraPosition) async {
    log('camera move ${_cameraPosition.target.latitude}');
    final GoogleMapController _controller = await _mapController.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  void _locationChanges(LatLng _latLong) {
    log('location changes ${_latLong.latitude}');
    CameraPosition _cameraPostion = CameraPosition(
        target: LatLng(_latLong.latitude, _latLong.longitude),
        zoom: _defaultZoomLevel);


    _camerMove(_cameraPostion);
  }

  void _liveLocation() {
    log('live location');
    _locationServices.getUserLocation(
        locationPosition: _defaultLocation, locationChanges: _locationChanges);
  }

  @override
  Widget build(BuildContext context) {
    final _initalCameraPostion =
        CameraPosition(target: _defaultLocation, zoom: _defaultZoomLevel);

    if (widget.isLiveLocation) {
      _liveLocation();
    }

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initalCameraPostion,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: _onMapCreate,
    );
  }
}
