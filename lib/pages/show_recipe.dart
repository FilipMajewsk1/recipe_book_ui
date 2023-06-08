import 'package:flutter/material.dart';
import 'package:recipe_book_ui/pages/widgets/recipe_ingredients_steps_card.dart';
import 'package:recipe_book_ui/recipe_data/recipe.dart';
import 'package:recipe_book_ui/recipe_data/requests.dart';

class ShowRecipe extends StatefulWidget {
  final int id;
  const ShowRecipe({
    Key? key,
    required this.id,
  }) :super(key : key);


  @override
  State<ShowRecipe> createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {

  late Future<Recipe> futureRecipe;
  late Recipe recipe ;
  late List<String> ing;
  late List<String> stp;


  initState(){
    super.initState();
    futureRecipe=BaseRecipe.getRecipe(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: FutureBuilder<Recipe>(
        future: futureRecipe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ));
          } else {
            return Text('');
          }
        },
      ),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 186, 5),
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
              width: 300,
              child: Scrollbar(
                child: FutureBuilder<Recipe>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<String> ing = snapshot.data!.ingredients.split(";");
                      return (buildList(ing));
                    }
                    return (Center(
                        child:CircularProgressIndicator()));
                  },
              ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 230, 5),
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
              width: 300,
              child: Scrollbar(
                child:
                FutureBuilder<Recipe>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<String> stp = snapshot.data!.steps.split(";");
                      return (buildList(stp));
                    }
                    return (Center(
                         child:CircularProgressIndicator()));
                  },
                ),
                // ListView(
                //   children: ing.map((i) => RecipeIngredientsStepsCard(ingredientOrStep: i)).toList(),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(List<String> list) =>
      ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            final l=list[index];
            return RecipeIngredientsStepsCard(ingredientOrStep: l);
          }
      );
  }


