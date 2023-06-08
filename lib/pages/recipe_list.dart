import 'package:flutter/material.dart';
import 'package:recipe_book_ui/recipe_data/recipe.dart';
import 'package:recipe_book_ui/recipe_data/requests.dart';
import 'widgets/recipe_list_card.dart';
class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {

  Future<List<Recipe>> recipes = BaseRecipe.getList("recipe");

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
          child: FutureBuilder<List<Recipe>>(
              future: recipes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final recipee = snapshot.data!;
                  return buildRecipes(recipee);
                }
                else {
                  return (Center(
                      child:CircularProgressIndicator()));
                }
              }
          ),
        ),
      ),
    );
  }

  Widget buildRecipes(List<Recipe> recipes) =>
      ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context,index){
            final recipe=recipes[index];
            return RecipeListCard(name: recipe.name, id: recipe.id);
          }
      );
}

