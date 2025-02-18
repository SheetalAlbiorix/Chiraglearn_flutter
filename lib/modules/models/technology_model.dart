// To parse this JSON data, do
//
//     final technologyModel = technologyModelFromJson(jsonString);

import 'dart:convert';

List<TechnologyModel> technologyModelFromJson(String str) =>
    List<TechnologyModel>.from(
        json.decode(str).map((x) => TechnologyModel.fromJson(x)));

String technologyModelToJson(List<TechnologyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TechnologyModel {
  int? technologyId;
  String? name;

  TechnologyModel({
    this.technologyId,
    this.name,
  });

  factory TechnologyModel.fromJson(Map<String, dynamic> json) =>
      TechnologyModel(
        technologyId: json["technology_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "technology_id": technologyId,
        "name": name,
      };
}
