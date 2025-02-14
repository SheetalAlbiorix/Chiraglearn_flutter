import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/modules/constants/custom_appbar.dart';
import 'package:intern_project/modules/constants/custom_textstyles.dart';
import 'package:intern_project/modules/constants/image_path.dart';
import 'package:intern_project/modules/constants/string_constants.dart';
import 'package:intern_project/modules/models/team_detail_model.dart';

class TeamDetailsSearchWithFilter extends StatefulWidget {
  const TeamDetailsSearchWithFilter({super.key});

  @override
  State<TeamDetailsSearchWithFilter> createState() =>
      _TeamDetailsSearchWithFilterState();
}

class _TeamDetailsSearchWithFilterState
    extends State<TeamDetailsSearchWithFilter> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  List filteredDataList = [];
  bool isVisible = false;

  List filterOptionList = [
    StringClass.selectValue,
    StringClass.filterOptionEmpId,
    StringClass.filterOptionName,
    StringClass.filterOptionPosition,
    StringClass.filterOptionEmail,
    StringClass.filterOptionMobile,
    StringClass.filterOptionHometown,
    StringClass.filterOptionTechnologies
  ];

  List technologyOptionList = [
    StringClass.selectValue,
    StringClass.android,
    StringClass.ios,
    StringClass.flutter,
    StringClass.reactNative,
    StringClass.kmm,
  ];
  String selectedTechnologyOption = StringClass.selectValue;

  String selectedFilterOption = StringClass.selectValue;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<TeamDetailsModel> allTeamList = [];
  bool isLoading = false;

  Future<void> loadJson() async {
    isLoading = true;

    String jsonString =
        await rootBundle.loadString("assets/team_member_data.json");
    var jsonList = jsonDecode(jsonString);

    setState(() {
      allTeamList = jsonList
          .map<TeamDetailsModel>((json) => TeamDetailsModel.fromJson(json))
          .toList();
      filteredDataList = allTeamList;
    });
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.appbar(StringClass.appBarTitle, true),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: selectedFilterOption ==
                            StringClass.filterOptionTechnologies
                        ? isVisible = false
                        : true,
                    child: Expanded(
                      child: TextFormField(
                        keyboardType: selectedFilterOption == "By Mobile"
                            ? TextInputType.phone
                            : selectedFilterOption == "By Email"
                                ? TextInputType.emailAddress
                                : TextInputType.name,
                        controller: searchController,
                        focusNode: searchFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter something";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            searchController.text = value;

                            if (value.isEmpty) {
                              filteredDataList =
                                  allTeamList; // Show full list if search is empty
                            } else if (value.isNotEmpty &&
                                selectedFilterOption ==
                                    StringClass.selectValue) {
                              filteredDataList = allTeamList.where(
                                (element) {
                                  return element.empId!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element.name!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element.position!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element.email!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element.mobile!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      element.hometown!
                                          .toLowerCase()
                                          .contains(value.toLowerCase());
                                },
                              ).toList();
                            } else if (value.isNotEmpty &&
                                selectedFilterOption !=
                                    StringClass.selectValue) {
                              filteredDataList = allTeamList.where((element) {
                                return selectedFilterOption == "By EmpId"
                                    ? element.empId!
                                        .toLowerCase()
                                        .contains(value.toLowerCase())
                                    : selectedFilterOption == "By Name"
                                        ? element.name!
                                            .toLowerCase()
                                            .contains(value.toLowerCase())
                                        : selectedFilterOption == "Position"
                                            ? element.position!
                                                .toLowerCase()
                                                .contains(value.toLowerCase())
                                            : selectedFilterOption == "By Email"
                                                ? element.email!
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase())
                                                : selectedFilterOption ==
                                                        "By Mobile"
                                                    ? element.mobile!
                                                        .toLowerCase()
                                                        .contains(
                                                            value.toLowerCase())
                                                    : element.hometown!
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase());
                              }).toList();
                            }
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.white,
                    width: selectedFilterOption ==
                            StringClass.filterOptionTechnologies
                        ? 200
                        : 170,
                    child: DropdownButtonFormField(
                      value: selectedFilterOption,
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.filter_list_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      items: filterOptionList.map(
                        (value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.smallTextStyle),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedFilterOption = value!;
                        });
                      },
                    ),
                  ),
                  Visibility(
                      visible: selectedFilterOption ==
                              StringClass.filterOptionTechnologies
                          ? true
                          : false,
                      child: Spacer()),
                  Visibility(
                    visible: selectedFilterOption ==
                            StringClass.filterOptionTechnologies
                        ? true
                        : false,
                    child: Container(
                      color: Colors.white,
                      width: selectedFilterOption ==
                              StringClass.filterOptionTechnologies
                          ? 200
                          : 170,
                      child: DropdownButtonFormField(
                        value: selectedTechnologyOption,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.filter_list_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        items: technologyOptionList.map(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.smallTextStyle),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTechnologyOption = value!;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : filteredDataList.isEmpty
                        ? Center(
                            child: Text("No Data Found."),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                itemCount: filteredDataList.length,
                                itemBuilder: (context, index) {
                                  var item = filteredDataList[index];
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
                                                    color: Colors.pinkAccent,
                                                    width: 6))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade300,
                                                  backgroundImage: item
                                                          .profile.isNotEmpty
                                                      ? AssetImage(
                                                          item.profile!)
                                                      : AssetImage(ImagesPath
                                                          .placeHolder),
                                                  radius: 50,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.employeeId,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.empId!),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.name,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.name),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.position,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(
                                                      item.position.toString()),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.location,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.location),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.department,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.department),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.email,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.email),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    StringClass.mobile,
                                                    style: CustomTextStyles
                                                        .mediumTextStyle,
                                                  ),
                                                  Text(item.department),
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
