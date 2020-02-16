import 'dart:convert';
import 'meal.dart';

Meals responseFilterFromJson(String str) => Meals.fromJson(json.decode(str));

String responseFilterToJson(Meals data) => json.encode(data.toJson());

class Meals {
  List<Meal> meals;

  Meals({
    this.meals,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}
