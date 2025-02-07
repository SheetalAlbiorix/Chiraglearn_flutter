// To parse this JSON data, do
//
//     final teamDetailsModel = teamDetailsModelFromJson(jsonString);

import 'dart:convert';

List<TeamDetailsModel> teamDetailsModelFromJson(String str) =>
    List<TeamDetailsModel>.from(
        json.decode(str).map((x) => TeamDetailsModel.fromJson(x)));

String teamDetailsModelToJson(List<TeamDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamDetailsModel {
  int? id;
  String? empId;
  String? name;
  String? profile;
  Position? position;
  String? email;
  String? mobile;
  Location? location;
  Department? department;
  String? team;
  String? hometown;
  List<int>? technologies;

  TeamDetailsModel({
    this.id,
    this.empId,
    this.name,
    this.profile,
    this.position,
    this.email,
    this.mobile,
    this.location,
    this.department,
    this.team,
    this.hometown,
    this.technologies,
  });

  factory TeamDetailsModel.fromJson(Map<String, dynamic> json) =>
      TeamDetailsModel(
        id: json["id"],
        empId: json["emp_id"],
        name: json["name"],
        profile: json["profile"],
        position: positionValues.map[json["position"]]!,
        email: json["email"],
        mobile: json["mobile"],
        location: locationValues.map[json["location"]]!,
        department: departmentValues.map[json["department"]]!,
        team: json["team"],
        hometown: json["hometown"],
        technologies: json["technologies"] == null
            ? []
            : List<int>.from(json["technologies"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "emp_id": empId,
        "name": name,
        "profile": profile,
        "position": positionValues.reverse[position],
        "email": email,
        "mobile": mobile,
        "location": locationValues.reverse[location],
        "department": departmentValues.reverse[department],
        "team": team,
        "hometown": hometown,
        "technologies": technologies == null
            ? []
            : List<dynamic>.from(technologies!.map((x) => x)),
      };
}

enum Department { SOFTWARE }

final departmentValues = EnumValues({"software": Department.SOFTWARE});

enum Location { AHMEDABAD }

final locationValues = EnumValues({"ahmedabad": Location.AHMEDABAD});

enum Position {
  MOBILE_PROJECT_MANAGER,
  SOFTWARE_ENGINEER,
  TEAM_LEAD,
  TRAINEE_SOFTWARE_ENGINEER
}

final positionValues = EnumValues({
  "Mobile Project Manager": Position.MOBILE_PROJECT_MANAGER,
  "Software Engineer": Position.SOFTWARE_ENGINEER,
  "Team Lead": Position.TEAM_LEAD,
  "Trainee Software Engineer": Position.TRAINEE_SOFTWARE_ENGINEER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
