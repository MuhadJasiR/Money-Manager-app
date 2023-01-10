// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      padding: const EdgeInsets.only(left: 200),
                      child: Text(
                        "Jasir Ali",
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 212, 212),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 125, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text("View All"))
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
