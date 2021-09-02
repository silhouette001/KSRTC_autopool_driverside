import 'package:demo_current_location/google_map.dart';
import 'package:demo_current_location/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_current_location/provider/online.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(body: GoogleMapPage()),
      ),
    );
  }
}
