import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intern_project/modules/constants/custom_appbar.dart';
import 'package:intern_project/modules/constants/custom_textstyles.dart';
import 'package:intern_project/modules/constants/image_path.dart';
import 'package:intern_project/modules/constants/string_constants.dart';

class TeamDetailsUsingJsonDropDown extends StatefulWidget {
  const TeamDetailsUsingJsonDropDown({super.key});

  @override
  State<TeamDetailsUsingJsonDropDown> createState() =>
      _TeamDetailsUsingJsonDropDownState();
}

class _TeamDetailsUsingJsonDropDownState
    extends State<TeamDetailsUsingJsonDropDown> {
  List allTeamList = [];
  List dropDownTeamList = [];
  bool isLoading = true;

  String? selectedTeamMate;

  loadJsonData() async {
    final String jsonData = await rootBundle.loadString(StringClass.jsonPath);

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
        appBar:
            CustomAppbar.appbar("Team details data filter using where()", true),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select a team member :",
                      style: CustomTextStyles.mediumTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
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
                          items:
                              allTeamList.map<DropdownMenuItem<String>>((map) {
                            return DropdownMenuItem<String>(
                              value: map['name'],
                              child: Text(map['name']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedTeamMate = value;

                              var selectedElement = allTeamList.where(
                                (element) {
                                  return element['name'] == selectedTeamMate;
                                },
                              ).toList();

                              print("selectedElement : $selectedElement");

                              if (selectedTeamMate != "Sheetal Gajjar") {
                                dropDownTeamList = allTeamList.where(
                                  (element) {
                                    return element['team'] ==
                                        selectedElement[0]['team'];
                                  },
                                ).toList();
                                print("dropDownTeamList : $dropDownTeamList");
                              } else {
                                dropDownTeamList = allTeamList;
                              }
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return StringClass.selectTeamMember;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            itemCount: dropDownTeamList.length,
                            itemBuilder: (context, index) {
                              var item = dropDownTeamList[index];
                              return Card(
                                elevation: 2,
                                shadowColor: Colors.blue.shade200,
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.green,
                                                width: 6))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              backgroundImage: item['profile']
                                                      .isNotEmpty
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
                                                StringClass.employeeId,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.name,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.position,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.location,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.department,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.email,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                                                StringClass.mobile,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
