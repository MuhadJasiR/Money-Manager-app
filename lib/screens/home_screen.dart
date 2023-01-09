// ignore_for_file: sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager_app/screens/categories.dart';
import 'package:money_manager_app/screens/finalcial_report.dart';
import 'package:money_manager_app/screens/settings.dart';

List<Widget> periods = <Widget>[
  Text("Today"),
  Text("Week"),
  Text("Month"),
  Text("Years"),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _selectPeriods = <bool>[true, true, false, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 247, 255),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 43, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "THURSDAY 5\nJANUARY",
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 173),
                      child: Text(
                        "Jasir Ali",
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
                Positioned(
                  left: 115,
                  top: 70,
                  child: Column(
                    children: const [
                      Text(
                        "Account Balance",
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\u{20B9} ${9400.0}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 23.5,
                  top: 160,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 47, 137, 255),
                    ),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      height: 210,
                      width: 360,
                    ),
                  ),
                ),
                Positioned(
                  top: 175,
                  left: 50,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.white,
                        size: 85,
                      ),
                      Text(
                        "Income",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25000",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 175,
                  left: 220,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.white,
                        size: 85,
                      ),
                      Text(
                        "Expenses",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "11200",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  left: 30,
                  child: ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      print(index);
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
                    children: periods,
                    isSelected: _selectPeriods,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 125, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Transation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("View All")
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.arrow_upward,
                              color: Colors.blue,
                              size: 30,
                            ),
                            title: Text(
                              "Shopping",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text("15 march 2022"),
                            trailing: Text(
                              "+150",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
