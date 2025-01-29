import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_text_styles.dart';

class ResultLogical extends StatefulWidget {
  final String iconText;

  const ResultLogical({super.key, required this.iconText});

  @override
  State<ResultLogical> createState() => _ResultLogicalState();
}

class _ResultLogicalState extends State<ResultLogical> {
  bool? result;

  final list1 = ["true", "false"];

  String? dropdownValue;
  String? dropdownValue1;

  final list2 = ["true", "false"];

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Result Screen", true),
      body: widget.iconText == "!"
          ? Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          widget.iconText,
                          style: CustomTextStyles.appbarTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please select value";
                              }
                              return null;
                            },
                            focusColor: Colors.transparent,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            value: dropdownValue1,
                            elevation: 2,
                            menuMaxHeight: 300,
                            hint: Text('Choose an option'),
                            items: list2
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownValue1 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            var value1 = bool.parse(dropdownValue1!);

                            if (value1 == true) {
                              setState(() {
                                result = !value1;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  result.toString(),
                                  style: CustomTextStyles.appbarTextStyle
                                      .copyWith(color: Colors.white),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(50),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              setState(() {
                                result = !value1;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  result.toString(),
                                  style: CustomTextStyles.appbarTextStyle
                                      .copyWith(color: Colors.white),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(50),
                                backgroundColor: Colors.green,
                              ));
                            }
                          }
                        },
                        child: Text("Submit"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 200,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please select value";
                              }
                              return null;
                            },
                            focusColor: Colors.transparent,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            value: dropdownValue,
                            elevation: 2,
                            menuMaxHeight: 300,
                            hint: Text('Choose an option'),
                            items: list1
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          widget.iconText,
                          style: CustomTextStyles.appbarTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please select value";
                              }
                              return null;
                            },
                            focusColor: Colors.transparent,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            value: dropdownValue1,
                            elevation: 2,
                            menuMaxHeight: 300,
                            hint: Text('Choose an option'),
                            items: list2
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownValue1 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      widget.iconText == "&&"
                          ? ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  var value1 = bool.parse(dropdownValue!);
                                  var value2 = bool.parse(dropdownValue1!);

                                  if ((value1 && value2) == true) {
                                    setState(() {
                                      result = value1 && value2;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        result.toString(),
                                        style: CustomTextStyles.appbarTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(50),
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    setState(() {
                                      result = value1 && value2;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        result.toString(),
                                        style: CustomTextStyles.appbarTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(50),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                }
                              },
                              child: Text("Submit"),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  var value1 = bool.parse(dropdownValue!);
                                  var value2 = bool.parse(dropdownValue1!);

                                  if ((value1 || value2) == true) {
                                    setState(() {
                                      result = value1 || value2;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        result.toString(),
                                        style: CustomTextStyles.appbarTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(50),
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    setState(() {
                                      result = value1 || value2;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        result.toString(),
                                        style: CustomTextStyles.appbarTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(50),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                }
                              },
                              child: Text("Submit"),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
