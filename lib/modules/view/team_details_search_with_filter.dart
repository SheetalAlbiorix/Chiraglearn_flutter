import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/modules/constants/custom_appbar.dart';
import 'package:intern_project/modules/constants/custom_textstyles.dart';
import 'package:intern_project/modules/constants/image_path.dart';
import 'package:intern_project/modules/constants/string_constants.dart';
import 'package:intern_project/modules/models/team_detail_model.dart';
import 'package:intern_project/modules/models/technology_model.dart';

extension Capitalize on String {
  String capitalize() {
    if (trim().isNotEmpty) {
      final words = removeExtraSpaces()
          .split(' ')
          .map((e) => e[0].toUpperCase() + (e.length > 1 ? e.substring(1) : ''))
          .toList();
      return words.join(' ');
    } else {
      return this;
    }
  }

  String removeExtraSpaces() {
    if (trim().isEmpty) return '';
    return trim().replaceAll(RegExp(' +'), ' ');
  }
}

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

  bool isVisible = false;

  final ScrollController _scrollController = ScrollController();

  List filterOptionList = [
    StringClass.selectValue,
    StringClass.filterOptionEmpId,
    StringClass.filterOptionName,
    StringClass.filterOptionPosition,
    StringClass.filterOptionEmail,
    StringClass.filterOptionMobile,
    StringClass.filterOptionHometown,
    StringClass.filterOptionByTechnologies
  ];

  List technologyOptionList = [
    StringClass.selectTechnology,
    StringClass.android,
    StringClass.ios,
    StringClass.flutter,
    StringClass.reactNative,
    StringClass.kmm,
  ];
  String selectedTechnologyOption = StringClass.selectTechnology;

  String selectedFilterOption = StringClass.selectValue;

  List<String?> getTechnologyNames(List<int> technologyIds) {
    return technologyIds.map((id) {
      final technology = technologyList.firstWhere(
        (tech) => tech.technologyId == id,
        orElse: () => TechnologyModel(
            technologyId: -1, name: 'Unknown'), // Handle missing tech
      );
      return technology.name;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<TeamDetailsModel> allTeamList = [];

  List<TechnologyModel> technologyList = [];
  List<TeamDetailsModel> filteredDataList = [];

  bool isLoading = false;

  Future<void> loadJson() async {
    isLoading = true;

    String teamMemberJsonString =
        await rootBundle.loadString("assets/team_member_data.json");
    var teamMemberJsonList = jsonDecode(teamMemberJsonString);

    String technologyJsonString =
        await rootBundle.loadString("assets/technology.json");

    var technologyJsonList = jsonDecode(technologyJsonString);

    setState(() {
      allTeamList = teamMemberJsonList
          .map<TeamDetailsModel>((json) => TeamDetailsModel.fromJson(json))
          .toList();
      filteredDataList = allTeamList;

      technologyList = technologyJsonList
          .map<TechnologyModel>((json) => TechnologyModel.fromJson(json))
          .toList();
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
                  Container(
                    color: Colors.white,
                    width: 170,
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
                  SizedBox(width: 10),
                  Visibility(
                    visible: selectedFilterOption ==
                            StringClass.filterOptionByTechnologies
                        ? isVisible = false
                        : true,
                    child: Expanded(
                      child: TextFormField(
                        autofocus: true,
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
                          isLoading = true;

                          setState(() {
                            searchController.text = value;

                            if (value.isEmpty) {
                              filteredDataList =
                                  allTeamList; // Show full list if search is empty
                            } else if (value.isNotEmpty &&
                                selectedFilterOption ==
                                    StringClass.selectValue) {
                              print(
                                  "\n----------------------- Empty is Filter------------------------\n");

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
                              print(
                                  "\n-----------------------Using Filter------------------------\n");

                              filteredDataList = allTeamList.where((element) {
                                return selectedFilterOption == "By EmpId"
                                    ? element.empId!
                                        .toLowerCase()
                                        .contains(value.toLowerCase())
                                    : selectedFilterOption == "By Name"
                                        ? element.name!
                                            .toLowerCase()
                                            .contains(value.toLowerCase())
                                        : selectedFilterOption == "By Position"
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
                          isLoading = false;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedFilterOption ==
                            StringClass.filterOptionByTechnologies
                        ? true
                        : false,
                    child: Expanded(
                      child: Container(
                        color: Colors.white,
                        child: DropdownButtonFormField(
                          value: selectedTechnologyOption,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: technologyOptionList.map(
                            (value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            print(
                                "\n-----------------------$selectedTechnologyOption------------------------\n");
                            setState(() {
                              selectedTechnologyOption = value!;

                              if (selectedTechnologyOption ==
                                  StringClass.selectTechnology) {
                                filteredDataList =
                                    allTeamList; // Show all if "Select Value" is chosen
                              } else {
                                filteredDataList = allTeamList.where((member) {
                                  List<String?> technologyNames =
                                      getTechnologyNames(member.technologies);
                                  return technologyNames
                                      .contains(selectedTechnologyOption);
                                }).toList();
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : filteredDataList.isEmpty
                        ? Center(
                            child: Text("No Data Found."),
                          )
                        : Scrollbar(
                            thickness: 6,
                            radius: Radius.circular(20),
                            interactive: true,
                            controller: _scrollController,
                            child: ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              itemCount: filteredDataList.length,
                              itemBuilder: (context, index) {
                                var item = filteredDataList[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: index.isOdd
                                            ? Radius.circular(50)
                                            : Radius.circular(0),
                                        bottomRight: index.isOdd
                                            ? Radius.circular(50)
                                            : Radius.circular(0),
                                        topRight: index.isOdd
                                            ? Radius.circular(0)
                                            : Radius.circular(50),
                                        bottomLeft: index.isOdd
                                            ? Radius.circular(0)
                                            : Radius.circular(50),
                                      ),
                                      border: Border(
                                        left: BorderSide(
                                          color: index.isEven
                                              ? Colors.pinkAccent
                                              : Colors.blueAccent,
                                          width: 5,
                                        ),
                                        top: BorderSide(
                                          color: index.isEven
                                              ? Colors.pinkAccent
                                              : Colors.blueAccent,
                                        ),
                                        bottom: BorderSide(
                                          color: index.isEven
                                              ? Colors.pinkAccent
                                              : Colors.blueAccent,
                                        ),
                                        right: BorderSide(
                                          color: index.isEven
                                              ? Colors.pinkAccent
                                              : Colors.blueAccent,
                                          width: 5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              backgroundImage: item
                                                      .profile!.isNotEmpty
                                                  ? AssetImage(item.profile!)
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
                                              Text(item.empId!.capitalize()),
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
                                              Text(item.name!),
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
                                              Text(item.position!),
                                            ],
                                          ),
                                          SizedBox(height: 5),
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
                                              Text(item.department!
                                                  .capitalize()),
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
                                              Text(item.email!),
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
                                              Text(item.mobile!),
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
                                                StringClass.homeTown,
                                                style: CustomTextStyles
                                                    .mediumTextStyle,
                                              ),
                                              Text(item.hometown!.capitalize()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
              )
            ],
          ),
        ));
  }
}
