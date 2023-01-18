// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset("asset/9888-money-money-money.gif"),
          Text(
            "Welcome to Money\n Manager",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(145, 139, 255, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You're amazing for taking this first step\n towards getting better control over your \nmoney and financial goals",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 105, 105, 105)),
          ),
          SizedBox(
            height: 65,
          ),
        ],
      ),
    );
  }
}
