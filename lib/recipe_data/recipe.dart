//TODO Zrób klasę przekonwertowaną z jsona
import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  int id;
  String name;
  String ingredients;
  String steps;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(json) => Recipe(
    id: json["id"],
    name: json["name"],
    ingredients: json["ingredients"],
    steps: json["steps"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ingredients": ingredients,
    "steps": steps,
  };
}