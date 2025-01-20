import 'package:flutter/material.dart';
import 'package:intern_project/datatype.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  var taskItems = ["Task 1 - Data Type Task"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text("INDEX"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: taskItems.length,
            itemBuilder: (context, index) {
              var index1 = index + 1;
              return InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DatatypeScreen();
                    },
                  ));
                },
                child: Card(
                  child: ListTile(
                    leading: Text(taskItems[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
