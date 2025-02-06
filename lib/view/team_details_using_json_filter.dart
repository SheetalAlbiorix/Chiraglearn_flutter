import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/constants/image_path.dart';
import 'package:intern_project/constants/string_constants.dart';

class TeamDetailsUsingJsonFilter extends StatefulWidget {
  const TeamDetailsUsingJsonFilter({super.key});

  @override
  State<TeamDetailsUsingJsonFilter> createState() =>
      _TeamDetailsUsingJsonFilterState();
}

class _TeamDetailsUsingJsonFilterState
    extends State<TeamDetailsUsingJsonFilter> {
  List allTeamList = [];
  List sazzadhusenTeamList = [];
  List allenceTeamList = [];
  List sohanTeamList = [];
  List sheetalTeamList = [];

  bool isLoading = true;

  String? selectedTeamMate;

  loadJsonData() async {
    final String jsonData =
        await rootBundle.loadString(StringConstants.jsonPath);

    List jsonList = jsonDecode(jsonData);
    setState(() {
      allTeamList = jsonList;
      allTeamList.sort((a, b) => a['name'].compareTo(b['name']));
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadJsonData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.appbar("Team Details using filter data", true),
        body: SingleChildScrollView(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: 400,
                          child: DropdownButtonFormField<String>(
                            menuMaxHeight: 400,
                            elevation: 3,
                            isExpanded: true,
                            isDense: true,
                            decoration: InputDecoration(
                              hoverColor: WidgetStateColor.transparent,
                              hintText: "Select Team Member",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            value: selectedTeamMate,
                            items: allTeamList
                                .map<DropdownMenuItem<String>>((map) {
                              return DropdownMenuItem<String>(
                                value: map['name'],
                                child: Text(map['name']),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedTeamMate = value;

                                print("selectedTeamMate : $selectedTeamMate");
                                if (selectedTeamMate == "Sheetal Gajjar") {
                                  sheetalTeamList = allTeamList.where(
                                    (element) {
                                      return element['team'] == "SG";
                                    },
                                  ).toList();
                                  print("sheetalTeamList: $sheetalTeamList");
                                } else if (selectedTeamMate == "Sohan Bhadra") {
                                  sohanTeamList = allTeamList.where(
                                    (element) {
                                      return element['team'] == "SB";
                                    },
                                  ).toList();
                                  print("sohanTeamList: $sohanTeamList");
                                } else if (selectedTeamMate ==
                                    "Allence Vakhariya") {
                                  allenceTeamList = allTeamList.where(
                                    (element) {
                                      return element['team'] == "AV";
                                    },
                                  ).toList();
                                  print("allenceTeamList: $allenceTeamList");
                                } else if (selectedTeamMate ==
                                    "Sazzadhusen Iproliya") {
                                  sazzadhusenTeamList = allTeamList.where(
                                    (element) {
                                      return element['team'] == "SI";
                                    },
                                  ).toList();
                                  print(
                                      "sazzadhusenTeamList: $sazzadhusenTeamList");
                                } else {
                                  allTeamList = allTeamList;
                                }
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select any team member';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      itemCount: selectedTeamMate == "Sheetal Gajjar"
                          ? sheetalTeamList.length
                          : selectedTeamMate == "Sohan Bhadra"
                              ? sohanTeamList.length
                              : selectedTeamMate == "Allence Vakhariya"
                                  ? allenceTeamList.length
                                  : selectedTeamMate == "Sazzadhusen Iproliya"
                                      ? sazzadhusenTeamList.length
                                      : allTeamList.length,
                      itemBuilder: (context, index) {
                        var item;
                        selectedTeamMate == "Sheetal Gajjar"
                            ? item = sheetalTeamList[index]
                            : selectedTeamMate == "Sohan Bhadra"
                                ? item = sohanTeamList[index]
                                : selectedTeamMate == "Allence Vakhariya"
                                    ? item = allenceTeamList[index]
                                    : selectedTeamMate == "Sazzadhusen Iproliya"
                                        ? item = sazzadhusenTeamList[index]
                                        : item = allTeamList[index];
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
                                      left: BorderSide(
                                          color: Colors.green, width: 6))),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade300,
                                        backgroundImage:
                                            item['profile'].isNotEmpty
                                                ? AssetImage(item['profile'])
                                                : AssetImage(
                                                    ImagesPath.placeHolder),
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                                          style:
                                              CustomTextStyles.mediumTextStyle,
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
                  ],
                ),
        ));
  }
}

//var firstEven = allTeamList.firstWhere(
//(element) =>
//element['name'] == selectedTeamMate);
//
//if (!(firstEven['name']
//.toString()
//.contains("Sheetal Gajjar"))) {
//sheetalTeamList = allTeamList.where(
//(element) {
//return element['team'] ==
//firstEven['team'];
//},
//).toList();
//} else {
//allTeamList = allTeamList;
//}
