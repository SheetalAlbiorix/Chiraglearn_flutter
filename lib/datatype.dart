import 'package:flutter/material.dart';

class DatatypeScreen extends StatefulWidget {
  const DatatypeScreen({super.key});

  @override
  State<DatatypeScreen> createState() => _DatatypeScreenState();
}

class _DatatypeScreenState extends State<DatatypeScreen> {
  var titleItems = [
    "Integer Values",
    "Double Values",
    "String Values",
    "Boolean Values",
    "List Values"
  ];
  var items = [
    10,
    10.10,
    "chirag",
    true,
    [10, 20, 30, 40, 50]
  ];
  int integerValue = 20;
  double doubleValue = 10.20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Type page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(titleItems[index]),
                subtitle: Text(
                  items[index].toString(),
                  style: TextStyle(
                    color: Colors.grey,
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
