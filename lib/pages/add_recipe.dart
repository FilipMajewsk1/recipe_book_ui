import 'package:flutter/material.dart';
import 'package:recipe_book_ui/pages/widgets/recipe_ingredients_steps_card.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ingController = TextEditingController();
  TextEditingController stepController = TextEditingController();

  String labelForNameTextfield = "Enter recipe name";
  String name = "";
  List<String> ing = [];
  List<String> stp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add recipe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.purple[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 245, 5),
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText:'Enter recipe name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,15,0,0),
                      child: ElevatedButton.icon(
                        onPressed: (){
                          setState(() {
                            if (nameController.text != "") {
                              name = nameController.text;
                            }
                          });
                        },
                        icon: Icon(Icons.check),
                        label: Text("Enter") ,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                          minimumSize: MaterialStateProperty.all(Size(100, 35)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 190, 5),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: 300,
                child: ListView(
                  children: ing.map((i) => RecipeIngredientsStepsCard(ingredientOrStep: i)).toList(),
                ),
              ),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: ingController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter ingredient",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,15,0,0),
                      child: ElevatedButton.icon(
                        onPressed: (){
                          if(ingController.text!="") {
                            setState(() {
                              ing.add(ingController.text);
                            });
                          }
                          ingController.clear();
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add") ,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                          minimumSize: MaterialStateProperty.all(Size(100, 35)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 245, 5),
                child: Text(
                  "Steps",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: 300,
                child: ListView(
                  children: stp.map((s) => RecipeIngredientsStepsCard(ingredientOrStep: s)).toList(),
                ),
              ),

              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: stepController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter step",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,20,0,0),
                      child: ElevatedButton.icon(
                        onPressed: (){
                          if(stepController.text!="") {
                            setState(() {
                              stp.add(stepController.text);
                            });
                          }
                          stepController.clear();
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add") ,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                          minimumSize: MaterialStateProperty.all(Size(100, 35)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.add),
                  label: Text(
                    "Add recipe",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                    fixedSize: MaterialStateProperty.all(Size(200,50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
