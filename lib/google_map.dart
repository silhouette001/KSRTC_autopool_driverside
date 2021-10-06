import 'package:demo_current_location/provider/location_provider.dart';
import 'package:demo_current_location/provider/online.dart';
import 'package:demo_current_location/widgets/popcard1.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'widgets/map_widgets.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  bool locationActive = false;
  void _onChange(bool _val) {
    if (locationActive != _val) setState(() => locationActive = _val);
    print('location $locationActive');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidgets(isLiveLocation: locationActive),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
                child: OnlineButton(
                    onChange: _onChange, isActive: locationActive)),
          ),
          
          PopCard(),
          
        ],
      ),
       floatingActionButton: Column(
        children: [
          Padding(
           // padding: EdgeInsets.only(top: mediaQuery.padding.bottom),//error in media query
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Image.asset('assets/icons/additional_menu.png'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ), //Floating action button for additional info drawer
          ),
        ],
       ),
    );
    
  }
}
