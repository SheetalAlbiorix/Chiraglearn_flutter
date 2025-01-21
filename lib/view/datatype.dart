import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';

class DatatypeScreen extends StatefulWidget {
  const DatatypeScreen({super.key});

  @override
  State<DatatypeScreen> createState() => _DatatypeScreenState();
}

class _DatatypeScreenState extends State<DatatypeScreen> {
  var titleItems = [
    "Integer :",
    "Double :",
    "String :",
    "Boolean :",
    "List :",
    "Sets :",
    "Maps :"
  ];
  var items = [
    10,
    10.10,
    "chirag",
    true,
    [10, 20, 30, 40, 50],
    {
      'banana',
      'apple',
      'orange',
    },
    {
      1: 'One',
      2: 'Two',
      3: 'Three',
    },
  ];
  int integerValue = 20;
  double doubleValue = 10.20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade100,
        appBar: CustomAppbar().appbar("DATA TYPES"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Center(
                  child: ListTile(
                    title: Text(
                      titleItems[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      items[index].toString(),
                      style: TextStyle(),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
