import 'dart:async';

import 'package:advance_flutter_exam/Components/Colors/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'home_screen');
    });
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h / 4,
            ),
            Image.asset('lib/Assets/splashScreen.gif'),
            SizedBox(
              height: h / 5,
            ),
            Text(
              "Country App",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
