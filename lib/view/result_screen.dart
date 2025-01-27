import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class ResultScreen extends StatefulWidget {
  final String iconText;

  ResultScreen({super.key, required this.iconText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  final _key = GlobalKey<FormState>();

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
                onChanged: (value) {
                  setState(() {});
                },
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
                    signed: true, decimal: true),
                decoration: InputDecoration(
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
                      if (widget.iconText == "+") {
                        add();
                      } else if (widget.iconText == "-") {
                        subtract();
                      }
                    }
                  },
                  child: Text("Submit")),
              SizedBox(
                height: 20,
              ),
              controller1.text.isEmpty || controller2.text.isEmpty
                  ? Container()
                  : Text("Result: $result")
            ],
          ),
        ),
      ),
    );
  }
}
