import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class Relational extends StatelessWidget {
  final String title;
  final List iconListItem = ["==", "!=", "<", ">", "<=", ">="];
  final List titleListItem = [
    "Equal",
    "Not Equal",
    "Less than",
    "Greater than",
    "Less than or equal to",
    "Greater than or equal to"
  ];

  Relational({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar(title, true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: iconListItem.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Card(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      iconListItem[index],
                      style: CustomTextStyles.appbarTextStyle,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      titleListItem[index],
                      style: CustomTextStyles.normalTextStyle,
                    )
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
