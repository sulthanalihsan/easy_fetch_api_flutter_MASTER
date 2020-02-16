// To parse this JSON data, do
//
//     final responseDetail = responseDetailFromJson(jsonString);

import 'dart:convert';

DetailMeal responseDetailFromJson(String str) =>
    DetailMeal.fromJson(json.decode(str));

String responseDetailToJson(DetailMeal data) => json.encode(data.toJson());

class DetailMeal {
  List<Map<String, String>> meals;

  DetailMeal({
    this.meals,
  });

  factory DetailMeal.fromJson(Map<String, dynamic> json) => DetailMeal(
        meals: List<Map<String, String>>.from(json["meals"].map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
      };
}
