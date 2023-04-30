import 'package:flutter/material.dart';
import 'package:recipe_book_ui/pages/widgets/recipe_ingredients_steps_card.dart';
import 'package:recipe_book_ui/recipe_data/recipe.dart';

class ShowRecipe extends StatefulWidget {
  const ShowRecipe({Key? key}) : super(key: key);

  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {

  late Recipe recipe;
  late List<String> ing;
  late List<String> stp;

  void initState(){
    recipe = new Recipe(name: "recipeName", ingresdients:"ing1;ing2;ing3;ing4;ing5;ing6" , steps: "step1;step2;step3;step4;step5");
    ing = recipe.ingresdients.split(";");
    stp = recipe.steps.split(";");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
      recipe.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
          ),
        ),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 140, 5),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

              ),
            ),
            SizedBox(
              height: 270,
              width: 250,
              child: Scrollbar(
                child: ListView(
                  children: ing.map((i) => RecipeIngredientsStepsCard(ingredientOrStep: i)).toList(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 185, 5),
              child: Text(
                "Steps",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

              ),
            ),
            SizedBox(
              height: 270,
              width: 250,
              child: Scrollbar(
                child: ListView(
                  children: stp.map((s) => RecipeIngredientsStepsCard(ingredientOrStep: s)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
