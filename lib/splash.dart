import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_project/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3,
      ),
      () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return IndexScreen();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        "assets/images/splash_image.jpg",
      ),
      fit: BoxFit.cover,
    );
  }
}
