import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/view/extends.dart';
import 'package:intern_project/view/login.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = [
    "Task 6 - shopping cart demo using implement",
    "shape demo using extends",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("INDEX", true),
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
                    return index == 0 ? Login() : Extends();
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
