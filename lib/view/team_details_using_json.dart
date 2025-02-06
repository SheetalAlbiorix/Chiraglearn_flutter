import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/constants/image_path.dart';
import 'package:intern_project/constants/string_constants.dart';

class TeamDetailsUsingJson extends StatefulWidget {
  const TeamDetailsUsingJson({super.key});

  @override
  State<TeamDetailsUsingJson> createState() => _TeamDetailsUsingJsonState();
}

class _TeamDetailsUsingJsonState extends State<TeamDetailsUsingJson> {
  List list = [];

  loadJsonData() async {
    final String jsonData =
        await rootBundle.loadString(StringConstants.jsonPath);

    List jsonList = jsonDecode(jsonData);
    setState(() {
      list = jsonList;
      list.sort((a, b) => a['name'].compareTo(b['name']));
    });
  }

  @override
  void initState() {
    super.initState();

    loadJsonData();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Team Details", true),
      body: Scrollbar(
        controller: _scrollController,
        child: list.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index];
                  return Card(
                    elevation: 2,
                    shadowColor: Colors.blue.shade200,
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(color: Colors.green, width: 6))),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  backgroundImage: item['profile'].isNotEmpty
                                      ? AssetImage(item['profile'])
                                      : AssetImage(ImagesPath.placeHolder),
                                  radius: 50,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.employeeId,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['emp_id']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.name,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['name']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.position,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['position']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.location,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['location']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.department,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['department']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.email,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['email']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.mobile,
                                    style: CustomTextStyles.mediumTextStyle,
                                  ),
                                  Text(item['mobile']),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
