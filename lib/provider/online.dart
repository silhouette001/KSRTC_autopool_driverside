import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter/material.dart';
import 'package:demo_current_location/provider/location_provider.dart';
import 'package:provider/provider.dart';

class OnlineButton extends StatefulWidget {
  final dynamic Function(bool) onChange;
  final bool isActive;
  OnlineButton({this.onChange, this.isActive});
  @override
  _OnlineButtonState createState() => _OnlineButtonState();
}

class _OnlineButtonState extends State<OnlineButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return LiteRollingSwitch(
      value: widget.isActive,
      textOn: "Online",
      textOff: "Offline",
      colorOn: Colors.blue,
      colorOff: Colors.grey,
      onChanged: widget.onChange,
    );
  }
}
