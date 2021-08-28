import 'package:demo_current_location/google_map.dart';
import 'package:demo_current_location/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: GoogleMapPage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: GoogleMapPage(),
      ),
    );
  }
}
