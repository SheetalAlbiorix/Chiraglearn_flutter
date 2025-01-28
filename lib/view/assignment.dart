import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class Assignment extends StatelessWidget {
  final String title;

  Assignment({super.key, required this.title});

  static const List iconText = [
    "=",
    "+=",
    "-=",
    "*=",
    "/=",
    "~/=",
    "%=",
    "<<=",
    ">>=",
    "&=",
    "^=",
    "|="
  ];

  final List titleText = [
    "Initial Assignment",
    "Addition Assignment",
    "Subtraction Assignment",
    "Multiplication Assignment",
    "Division Assignment",
    "Integer Division Assignment",
    "Modulus Assignment",
    "Left Shift Assignment",
    "Right Shift Assignment",
    "BitWise AND Assignment",
    "Bitwise XOR Assignment",
    "Bitwise OR Assignment"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar.appbar(title, true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: iconText.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      iconText[index],
                      style: CustomTextStyles.appbarTextStyle,
                    ),
                    Text(
                      titleText[index],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
