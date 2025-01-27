import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';
import 'package:intern_project/view/arithmetic.dart';
import 'package:intern_project/view/relational.dart';

class OperatorDemonstration extends StatelessWidget {
  OperatorDemonstration({super.key});

  final List operatorListItems = [
    "Arithmetic operators",
    "Relational Operators",
    "Type Test Operators",
    "Bitwise Operators",
    "Assignment Operators",
    "Logical Operators",
    "Conditional Operators",
    "Cascade Notation Operators"
  ];

  final List screens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Operator Demonstration", false),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: operatorListItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: ListTile(
                leading: Text(
                  "${index + 1}",
                  style: CustomTextStyles.normalTextStyle,
                ),
                title: Text(operatorListItems[index]),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return index == 0
                                ? Arithmetic(
                                    title: operatorListItems[index],
                                  )
                                : index == 1
                                    ? Relational(
                                        title: operatorListItems[index],
                                      )
                                    : Container();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_forward_rounded)),
              )),
            );
          },
        ),
      ),
    );
  }
}
