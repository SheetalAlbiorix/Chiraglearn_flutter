import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class Address {
  String? city;
  String? state;
}

void main() {
  Address()
    ?..city = "ahmedabad"
    ..state = "gujarat";
}

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
            return InkWell(
              overlayColor:
                  WidgetStatePropertyAll(WidgetStateColor.transparent),
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
                                      "without cascade operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "var address = classAddress();\naddress.street('new road'\naddress.city('ahmedabad')\naddress.state('gujarat'))",
                                      style: CustomTextStyles.normalTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "using cascade operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "classAddress()\n..street('new road'\n..city('ahmedabad')\n..state('gujarat'))",
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
                                      "without cascade operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "var address = classAddress();\naddress.street('new road'\naddress.city('ahmedabad')\naddress.state('gujarat'))",
                                      style: CustomTextStyles.normalTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "using null cascade operator",
                                      style: CustomTextStyles.appbarTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "classAddress()\n?..street('new road'\n..city('ahmedabad')\n..state('gujarat'))",
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
