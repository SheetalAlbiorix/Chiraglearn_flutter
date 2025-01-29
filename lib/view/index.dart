import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = ["Task 1 - Data Type Task"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("INDEX"),
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
                    return Container();
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
