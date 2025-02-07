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
  int? technologyId;
  String? name;

  TeamDetailsModel({
    this.technologyId,
    this.name,
  });

  factory TeamDetailsModel.fromJson(Map<String, dynamic> json) =>
      TeamDetailsModel(
        technologyId: json["technology_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "technology_id": technologyId,
        "name": name,
      };
}
