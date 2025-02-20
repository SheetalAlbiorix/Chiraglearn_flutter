import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/constants/custom_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  loadJsonData() async {
    String jsonString = await rootBundle.loadString("assets/product.json");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.appbar("Inheritance", true),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(),
              );
            },
          ),
        ));
  }
}
