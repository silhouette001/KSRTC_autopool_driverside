import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:demo_current_location/provider/location_provider.dart';
import 'package:demo_current_location/google_map.dart';
import 'package:provider/provider.dart';

class OnlineButton extends StatefulWidget {
  @override
  _OnlineButtonState createState() => _OnlineButtonState();
}

class _OnlineButtonState extends State<OnlineButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            child: LiteRollingSwitch(
              value: true,
              textOn: "Online",
              textOff: "Offline",
              colorOn: Colors.blue,
              colorOff: Colors.grey,
              onChanged: (bool val) {
                isSwitched = !isSwitched;
                setState(() {
                  MultiProvider(providers: [
                    ChangeNotifierProvider(
                      create: (context) => LocationProvider(),
                      child: GoogleMapPage(),
                    ),]
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
