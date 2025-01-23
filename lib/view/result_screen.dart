import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';

class ResultScreen extends StatefulWidget {
  final bool single;
  final String functionName;
  final int indexNo;

  const ResultScreen({
    super.key,
    required this.single,
    required this.functionName,
    required this.indexNo,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isPress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.clear();
    controller2.clear();
    print("single : ${widget.single}");
    print("function : ${widget.functionName}");
    print("index : ${widget.indexNo}");
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  var result;

  absFunction() {
    setState(() {
      result = double.parse(controller1.text).abs();
    });
    print(result);

    return result;
  }

  ceilFunction() {
    setState(() {
      result = double.parse(controller1.text).ceil();
    });
    print(result);

    return result;
  }

  floorFunction() {
    setState(() {
      result = double.parse(controller1.text).floor();
    });
  }

  compareToFunction() {
    setState(() {
      result = controller1.text.compareTo(controller2.text).toString();
      print(result);

      return result;
    });
  }

  remainderFunction() {
    setState(() {
      result = double.parse(controller1.text)
          .remainder(double.parse(controller2.text));
    });
    print(result);

    return result;
  }

  roundFunction() {
    setState(() {
      result = double.parse(controller1.text).round();
    });
    print(result);

    return result;
  }

  toDoubleFunction() {
    setState(() {
      result = double.parse(controller1.text).toDouble();
    });
    print(result);

    return result;
  }

  toIntFunction() {
    setState(() {
      result = double.parse(controller1.text).toInt();
    });

    print(result);

    return result;
  }

  toStringFunction() {
    setState(() {
      result = controller1.text.toString();
    });

    print(result);

    return result;
  }

  truncateFunction() {
    setState(() {
      result = double.parse(controller1.text).truncate();
    });

    print(result);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar().appbar("${widget.functionName} function", true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: Colors.red.shade50,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller1,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    decoration: InputDecoration(
                      hintText: "Enter Value",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  widget.single == false
                      ? Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: controller2,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true, signed: true),
                              decoration: InputDecoration(
                                hintText: "Enter Value",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPress = true;
                            });
                            if (widget.indexNo == 0) {
                              print("clicked!");
                              absFunction();
                            } else if (widget.indexNo == 1) {
                              print("clicked!");
                              ceilFunction();
                            } else if (widget.indexNo == 2) {
                              print("clicked!");
                              floorFunction();
                            } else if (widget.indexNo == 3) {
                              print("clicked!");
                              compareToFunction();
                            } else if (widget.indexNo == 4) {
                              print("clicked!");
                              remainderFunction();
                            } else if (widget.indexNo == 5) {
                              roundFunction();
                            } else if (widget.indexNo == 6) {
                              toDoubleFunction();
                            } else if (widget.indexNo == 7) {
                              toIntFunction();
                            } else if (widget.indexNo == 8) {
                              toStringFunction();
                            } else {
                              truncateFunction();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text("output"),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          widget.indexNo == 0
                              ? Text(
                                  "==> Returns the absolute value of a number. \n\n==> The absolute value of a number is the number without its sign.",
                                )
                              : Container(),
                          widget.indexNo == 1
                              ? Text(
                                  "==> The ceil() function in Dart returns the nearest smallest integer value greater than or equal to a number.",
                                )
                              : Container(),
                          widget.indexNo == 2
                              ? Text(
                                  "==> The floor() function in Dart returns the next largest integer that is less than or equal to a specified number.",
                                )
                              : Container(),
                          widget.indexNo == 3
                              ? Text(
                                  " 0 − when the strings are equal.\n 1 − when the first string is greater than the second \n-1 − when the first string is smaller than the second",
                                )
                              : Container(),
                          widget.indexNo == 4
                              ? Text(
                                  "It returns the truncated remainder after dividing the two numbers.",
                                )
                              : Container(),
                          widget.indexNo == 5
                              ? Text(
                                  "==> The integer closest to this number.\n\n==> Rounds away from zero when there is no closest integer: (3.5).round() == 4 and (-3.5).round() == -4.",
                                )
                              : Container(),
                          widget.indexNo == 6
                              ? Text(
                                  "==> This method returns the double representation of the number's value.\n\n==> Returns a double representing the specified Number object.",
                                )
                              : Container(),
                          widget.indexNo == 7
                              ? Text(
                                  "==> The toInt() function converts the number to an integer and returns it.",
                                )
                              : Container(),
                          widget.indexNo == 8
                              ? Text(
                                  "==> Returns a string representation of an object.",
                                )
                              : Container(),
                          widget.indexNo == 9
                              ? Text(
                                  "==> Returns the integer obtained by discarding any fractional part of this number.",
                                )
                              : Container(),
                          SizedBox(
                            height: 20,
                          ),
                          isPress
                              ? AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeOut,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.green,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text("Answer : $result"),
                                  ))
                              : Container(),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
