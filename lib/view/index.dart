import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';
import 'package:intern_project/view/operator_demonstration.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = ["Task 3 - Dart Operators"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("INDEX", false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: taskItems.length,
          itemBuilder: (context, index) {
            return InkWell(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return OperatorDemonstration();
                  },
                ));
              },
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    taskItems[index],
                    style: CustomTextStyles.normalTextStyle,
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
