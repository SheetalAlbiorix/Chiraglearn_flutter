import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class ResultScreen extends StatefulWidget {
  final String iconText;

  const ResultScreen({super.key, required this.iconText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();

    super.dispose();
  }

  bool isVisible = false;

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  final _key = GlobalKey<FormState>();

  logicalAnd() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a < b && a <= b) {
      result = "value 1 is less than and less than equal to value 2";
    } else {
      result = "value 1 is greater than or equal to value 2";
    }
  }

  logicalOr() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a < b || a <= b) {
      result = "value 1 is less than and less than equal to value 2";
    } else {
      result = "value 1 is greater than  value 2";
    }
  }

  logicalNot() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (!(a > b)) {
      result = "value 1 is less than and less than equal to value 2";
    } else {
      result = "value 1 is greater than value 2";
    }
  }

  equal() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      if (a == b) {
        result = "value 1 equal to value 2";
      } else {
        result = "value 1 is not equal to value 2";
      }
    });
  }

  notEqual() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      if (a != b) {
        result = "value 1 is not equal to value 2";
      } else {
        result = "value 1 equal to value 2";
      }
    });
  }

  lessThan() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a < b) {
      result = "value1 is less than value2";
    } else {
      result = "value1 is not less than value2";
    }
  }

  lessThanOrEqual() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a <= b) {
      result = "value1 is less than or equal to value2";
    } else {
      result = "value1 is not less than or equal to value2";
    }
  }

  greaterThan() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a > b) {
      result = "value1 is Greater than value2";
    } else {
      result = "value1 is not Greater than value2";
    }
  }

  greaterThanOrEqual() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    if (a >= b) {
      result = "value1 is Greater than or equal to value2";
    } else {
      result = "value1 is not Greater than or equal to value2";
    }
  }

  add() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      result = (a + b).toString();
    });
  }

  subtract() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);

    setState(() {
      result = (a - b).toString();
    });
  }

  multiply() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      result = (a * b).toString();
    });
  }

  divide() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      result = (a / b).toString();
    });
  }

  modulo() {
    var a = double.parse(controller1.text);
    var b = double.parse(controller2.text);
    setState(() {
      result = (a % b).toString();
    });
  }

  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Result Screen", true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter any value";
                  }
                  return null;
                },
                controller: controller1,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                decoration: InputDecoration(
                  hintText: "Enter value ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Text(
                widget.iconText,
                style: CustomTextStyles.appbarTextStyle,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter any value";
                  }
                  return null;
                },
                controller: controller2,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                decoration: InputDecoration(
                  hintText: "Enter value ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      setState(() {
                        isVisible = true;
                      });
                      if (widget.iconText == "+") {
                        add();
                      } else if (widget.iconText == "-") {
                        subtract();
                      } else if (widget.iconText == "*") {
                        multiply();
                      } else if (widget.iconText == "/") {
                        divide();
                      } else if (widget.iconText == "==") {
                        equal();
                      } else if (widget.iconText == "!=") {
                        notEqual();
                      } else if (widget.iconText == "<") {
                        lessThan();
                      } else if (widget.iconText == ">") {
                        greaterThan();
                      } else if (widget.iconText == "<=") {
                        lessThanOrEqual();
                      } else if (widget.iconText == ">=") {
                        greaterThanOrEqual();
                      } else if (widget.iconText == "&&") {
                        logicalAnd();
                      } else if (widget.iconText == "!") {
                        logicalNot();
                      } else if (widget.iconText == "||") {
                        logicalOr();
                      } else {
                        modulo();
                      }
                    } else {
                      print("Not validated!");
                    }
                  },
                  child: Text("Submit")),
              SizedBox(
                height: 20,
              ),
              Visibility(visible: isVisible, child: Text("Result: $result"))
            ],
          ),
        ),
      ),
    );
  }
}
