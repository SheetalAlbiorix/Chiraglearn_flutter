import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/view/task_2_built_in_functions.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  var taskItems = ["Task 2 - Built-in-Functions"];

  var screens = [BuiltInFunctions()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar().appbar("INDEX", false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          color: Colors.purple.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: taskItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return screens[index];
                      },
                    ));
                  },
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        taskItems[index],
                        style: CustomTextStyles().normalTextStyle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
