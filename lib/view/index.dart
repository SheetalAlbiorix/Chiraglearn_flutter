import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/view/team_details_using_json.dart';
import 'package:intern_project/view/team_details_using_methods.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = [
    "Task 5.1 - Team Details Using Json",
    "Task 5.2 - Team Details Using Method"
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
                index == 0
                    ? Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TeamDetailsUsingJson();
                        },
                      ))
                    : index == 1
                        ? Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return TeamDetailsUsingMethod();
                            },
                          ))
                        : null;
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
