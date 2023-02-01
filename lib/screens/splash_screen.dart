// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/introduction_screen.dart';
import 'package:money_manager_app/widgets/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // checkFirstScreen(context);
    super.initState();
    Timer(Duration(seconds: 2), (() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool seen = (prefs.getBool("seen") ?? false);
      if (seen) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return BottomNavBar(context);
        })));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return IntroductionScreen();
        })));
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset("asset/SplashScreenLogo.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Money Manager",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}

// Future checkFirstScreen(context) async {
//   await Future.delayed(Duration(seconds: 2));
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool _seen = (prefs.getBool('seen') ?? false);
//   if (_seen) {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return BottomNavBar();
//     }));
//   } else {
//     // await prefs.setBool('seen', true);
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return IntroductionScreen();
//     }));
//   }
//   // prefs.clear();
// }
