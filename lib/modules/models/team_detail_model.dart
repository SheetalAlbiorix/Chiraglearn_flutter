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
  String? position;
  String? email;
  String? mobile;
  String? location;
  String? department;
  String? team;
  String? hometown;
  List<int> technologies;

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
    required this.technologies,
  });

  factory TeamDetailsModel.fromJson(Map<String, dynamic> json) =>
      TeamDetailsModel(
        id: json["id"],
        empId: json["emp_id"],
        name: json["name"],
        profile: json["profile"],
        position: json["position"],
        email: json["email"],
        mobile: json["mobile"],
        location: json["location"],
        department: json["department"],
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
        "position": position,
        "email": email,
        "mobile": mobile,
        "location": location,
        "department": department,
        "team": team,
        "hometown": hometown,
        "technologies": technologies == null
            ? []
            : List<dynamic>.from(technologies!.map((x) => x)),
      };
}
