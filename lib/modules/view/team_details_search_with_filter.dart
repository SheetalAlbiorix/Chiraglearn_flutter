import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_project/modules/constants/custom_appbar.dart';
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

  final _key = GlobalKey<FormState>();

  List filterListItems = [
    "By EmpId",
    "By Name",
    "By Position",
    "By Email",
    "By Mobile",
    "By Hometown",
    "By Technologies"
  ];
  String? selectedFilter;

  TeamDetailsModel allTeamList = TeamDetailsModel();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadJson() async {
    String jsonString =
        await rootBundle.loadString("assets/team_member_data.json");
    var data = jsonDecode(jsonString);
    allTeamList = TeamDetailsModel.fromJson(data);
    print(allTeamList);
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
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: selectedFilter == "By Mobile"
                            ? TextInputType.phone
                            : selectedFilter == "By Email"
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
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: DropdownButtonFormField(
                        value: selectedFilter,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return StringClass.selectFilter;
                          }
                          return null;
                        },
                        hint: Text("Filter By"),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.filter_list_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        items: filterListItems.map(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  // fontSize: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFilter = value;
                            print("selectedFilter : $selectedFilter");
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {}
                    },
                    child: Text("Submit")),
                SizedBox(
                  height: 10,
                ),
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: SizedBox(
                //       child: ListView.builder(
                //         shrinkWrap: true,
                //         physics: ScrollPhysics(),
                //         padding: EdgeInsets.symmetric(vertical: 20),
                //         itemCount: allTeamList.length,
                //         itemBuilder: (context, index) {
                //           var item = allTeamList[index];
                //           return Card(
                //             elevation: 2,
                //             shadowColor: Colors.blue.shade200,
                //             child: ClipPath(
                //               clipper: ShapeBorderClipper(
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(12))),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     border: Border(
                //                         left: BorderSide(
                //                             color: Colors.green, width: 6))),
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(20),
                //                   child: Column(
                //                     children: [
                //                       Center(
                //                         child: CircleAvatar(
                //                           backgroundColor: Colors.grey.shade300,
                //                           backgroundImage:
                //                               item.profile!.isNotEmpty
                //                                   ? AssetImage(
                //                                       item.profile.toString())
                //                                   : AssetImage(
                //                                       ImagesPath.placeHolder),
                //                           radius: 50,
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 20,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.employeeId,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.empId.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.name,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.name.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.position,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.position.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.location,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.location.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.department,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.department.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.email,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.email.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                       Divider(),
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             StringClass.mobile,
                //                             style: CustomTextStyles
                //                                 .mediumTextStyle,
                //                           ),
                //                           Text(item.department.toString()),
                //                         ],
                //                       ),
                //                       SizedBox(
                //                         height: 5,
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
