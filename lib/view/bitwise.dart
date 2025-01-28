import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class Bitwise extends StatelessWidget {
  final String title;

  Bitwise({super.key, required this.title});

  final List iconText = ["&", "|", "^", "~", "<<", ">>"];
  final List titleText = [
    "Binary AND",
    "Binary OR",
    "Binary XOR",
    "One's Compliment",
    "Left Shift",
    "Right Shift"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
