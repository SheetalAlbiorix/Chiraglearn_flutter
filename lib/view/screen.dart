import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';

class DemoClass extends StatefulWidget {
  const DemoClass({super.key});

  @override
  State<DemoClass> createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("title", true),
      body: Center(
        child: Text("homepage"),
      ),
    );
  }
}
