import 'package:flutter/material.dart';
import 'package:recipe_book_ui/Pages/home.dart';
import 'package:recipe_book_ui/Pages/add_recipe.dart';
import 'package:recipe_book_ui/Pages/recipe_list.dart';
import 'package:recipe_book_ui/pages/show_recipe.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/recipe_list': (context) => RecipeList(),
    '/add_recipe': (context) => AddRecipe(),
    '/show_recipe': (context) => ShowRecipe(),
  },
));
