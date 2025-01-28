import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';
import 'package:intern_project/view/result_screen.dart';

class Logical extends StatelessWidget {
  final String title;

  const Logical({super.key, required this.title});

  static const List iconText = ["!", "&&", "||"];

  static const titleText = ["Logical NOT", "Logical AND", "Logical OR"];

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
            return InkWell(
              overlayColor:
                  WidgetStatePropertyAll(WidgetStateColor.transparent),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(iconText: iconText[index]),
                    ));
              },
              child: Card(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
