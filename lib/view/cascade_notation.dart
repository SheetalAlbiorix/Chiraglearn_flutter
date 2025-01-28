import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class CascadeNotation extends StatelessWidget {
  final String title;

  const CascadeNotation({super.key, required this.title});

  static const List iconText = ["..", "?.."];

  static const titleText = ["Cascade Operator", "Null Shorting Cascade"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar(title, true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: iconText.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
