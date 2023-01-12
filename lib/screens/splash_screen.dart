// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:money_manager_app/screens/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHomeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 100),
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

Future<void> gotoHomeScreen(context) async {
  await Future.delayed(Duration(seconds: 1));
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
    return const IntroductionScreen();
  }));
}
