import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_text_styles.dart';
import 'package:intern_project/view/result_screen.dart';

class Arithmetic extends StatelessWidget {
  final String title;

  Arithmetic({super.key, required this.title});

  final List iconListItems = ["+", "-", "*", "/", "%"];
  final List titleListItems = [
    "Add",
    "Subtract",
    "Multiply",
    "Divide",
    "Modulo"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: CustomTextStyles.appbarTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: iconListItems.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return InkWell(
                overlayColor:
                    WidgetStatePropertyAll(WidgetStateColor.transparent),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          iconText: iconListItems[index],
                        ),
                      ));
                },
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          iconListItems[index],
                          style: CustomTextStyles.appbarTextStyle,
                        ),
                        Text(
                          titleListItems[index],
                          style: CustomTextStyles.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
