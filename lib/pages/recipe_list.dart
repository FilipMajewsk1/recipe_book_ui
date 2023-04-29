import 'package:flutter/material.dart';
import 'package:recipe_book_ui/recipe_data/recipe.dart';
import 'widgets/recipe_name_card.dart';
class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {

  List<Recipe> recipes = [
    Recipe(name: "recipe1", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe2", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe3", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe4", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe5", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe6", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe7", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe8", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe9", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe10", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe11", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe12", ingresdients: "ingresdients", steps: "steps"),
    Recipe(name: "recipe13", ingresdients: "ingresdients", steps: "steps")
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipe list",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
          child: Scrollbar(
            thickness: 20,
            child: ListView(
              children: recipes.map( (recipe) => RecipeListCard(name: recipe.name)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
