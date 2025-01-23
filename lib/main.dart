import 'package:flutter/material.dart';
import 'package:intern_project/view/splash.dart';

void main() {
  double a = 4.5;
  int b = 2;

  print("abs() - ${a.abs()}");
  print("ceil() - ${a.ceil()}");
  print("floor() - ${a.floor()}");
  print("compareTo() - ${a.compareTo(b)}");
  print("remainder() - ${a.remainder(b)}");
  print("round() - ${a.round()}");
  print("toDouble() - ${a.toDouble()}");
  print("toInt() - ${a.toInt()}");
  print("toString() - ${a.toString()}");
  print("truncate() - ${a.truncate()}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
