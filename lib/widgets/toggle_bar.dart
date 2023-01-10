// ignore_for_file: prefer_const_constructors
// ignore_for_file:

import 'package:flutter/material.dart';

List<Widget> periods = <Widget>[
  Text("Today"),
  Text("Week"),
  Text("Month"),
  Text("Year"),
];

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _Toggle_BarState();
}

class _Toggle_BarState extends State<ToggleButtonWidget> {
  List<bool> _selectPeriods = <bool>[true, false, false, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectPeriods.length; i++) {
            _selectPeriods[i] = i == index;
          }
        });
      },
      color: Colors.white,
      borderColor: Colors.white,
      borderRadius: BorderRadius.circular(25),
      selectedBorderColor: Color.fromARGB(255, 35, 43, 255),
      selectedColor: Colors.white,
      fillColor: Color.fromARGB(255, 35, 43, 255),
      constraints: BoxConstraints(minHeight: 30, minWidth: 85),
      isSelected: _selectPeriods,
      children: periods,
    );
  }
}
