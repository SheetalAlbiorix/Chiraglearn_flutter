import 'package:flutter/material.dart';
import 'package:intern_project/modules/constants/custom_appbar.dart';
import 'package:intern_project/modules/constants/custom_textstyles.dart';
import 'package:intern_project/modules/view/team_details_search_with_filter.dart';
import 'package:intern_project/modules/view/team_details_using_json.dart';
import 'package:intern_project/modules/view/team_details_using_json_drop_down.dart';
import 'package:intern_project/modules/view/team_details_using_methods.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = [
    "Task 5.1 - Team Details Using Json",
    "Task 5.2 - Team Details Using Method",
    "Task 5.3 - Team Details Using Json Filter",
    "Task 5.4 - Search With Filter in Team Details"
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
                        : index == 2
                            ? Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return TeamDetailsUsingJsonDropDown();
                                },
                              ))
                            : index == 3
                                ? Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return TeamDetailsSearchWithFilter();
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
