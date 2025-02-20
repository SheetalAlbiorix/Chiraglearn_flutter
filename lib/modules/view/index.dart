import 'package:flutter/material.dart';
import 'package:intern_project/modules/constants/custom_appbar.dart';
import 'package:intern_project/modules/constants/custom_textstyles.dart';
import 'package:intern_project/modules/view/search_with_filter_using_model.dart';
import 'package:intern_project/modules/view/team_details_load_rootBundle.dart';
import 'package:intern_project/modules/view/team_details_using_methods.dart';
import 'package:intern_project/modules/view/team_details_without_model.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final taskItems = [
    "Task 5.1 - Team Details load using Root Bundle",
    "Task 5.2 - Team Details Using Method",
    "Task 5.3 - Team Details without Model",
    "Task 5.4 - Search With Filter using Model"
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
                    return index == 0
                        ? TeamDetailsUsingRootBundle()
                        : index == 1
                            ? TeamDetailsUsingMethod()
                            : index == 2
                                ? TeamDetailsWithoutModel()
                                : SearchWithFilterUsingModel();
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
