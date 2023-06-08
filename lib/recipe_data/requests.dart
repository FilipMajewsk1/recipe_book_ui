import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_book_ui/recipe_data/recipe.dart';

const String baseURL ="http://10.147.20.177:8080/api/v1/";
//TODO zrób resztę metod
class BaseRecipe{
  var client = http.Client();
  static Future<List<Recipe>> getList(String api)async{

    var url=Uri.parse(baseURL+api);
    final response = await http.get(url);
    final body = jsonDecode(response.body);

    return body.map<Recipe>(Recipe.fromJson).toList();
  }

  static Future<Recipe> getRecipe(String id)async{
    var url=Uri.parse(baseURL+"recipe/get/"+id);
    final response = await http.get(url);
    final recipe = Recipe.fromJson(jsonDecode(response.body));
    return recipe;
  }

  static Future<bool> addRecipe(String name, String ingredients, String steps) async {
    final response = await http.post(
      Uri.parse(baseURL+"recipe/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'ingredients': ingredients,
        'steps': steps
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create recipe.');
    }
  }

  static Future<bool> deleteRecipe(String id) async {
    var url=Uri.parse(baseURL+"recipe/delete/"+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete recipe.');
    }
  }
}