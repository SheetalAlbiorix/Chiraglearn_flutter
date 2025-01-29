import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class Conditional extends StatelessWidget {
  final String title;

  const Conditional({super.key, required this.title});

  static const List iconText = ["Exp1?Exp2:Exp3", "Exp1??Exp2"];

  static const titleText = ["ternary operator", "if null operator"];

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
            return InkWell(
              onTap: () {
                index == 0
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Ternary operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "if(a <= 10) ? Number is less than or equal to 10 : Number is Greater than 10",
                                      style: CustomTextStyles.normalTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "if null operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "int? age; int userAge = age ?? 18 // assigns age 18 if age is null",
                                      style: CustomTextStyles.normalTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
              overlayColor:
                  WidgetStatePropertyAll(WidgetStateColor.transparent),
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
