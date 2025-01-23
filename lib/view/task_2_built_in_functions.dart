import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/view/result_screen.dart';

class BuiltInFunctions extends StatefulWidget {
  const BuiltInFunctions({super.key});

  @override
  State<BuiltInFunctions> createState() => _BuiltInFunctionsState();
}

class _BuiltInFunctionsState extends State<BuiltInFunctions> {
  bool single = true;
  List<String> functions = [
    "abs()",
    "ceil()",
    "floor()",
    "compareTo()",
    "remainder()",
    "round()",
    "toDouble()",
    "toInt()",
    "toString()",
    "truncate()",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar().appbar("Built in Functions", true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.red.shade50,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: functions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor:
                      WidgetStatePropertyAll(WidgetStateColor.transparent),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(
                          single: index == 3 || index == 4 ? !single : single,
                          functionName: functions[index],
                          indexNo: index,
                        );
                      },
                    ));
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        functions[index],
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
