import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class TypeTest extends StatelessWidget {
  final String title;

  TypeTest({super.key, required this.title});

  final List iconText = ["as", "is", "is!"];

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
                child: Text(
                  iconText[index],
                  style: CustomTextStyles.appbarTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
