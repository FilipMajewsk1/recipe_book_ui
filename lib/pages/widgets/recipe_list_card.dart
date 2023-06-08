import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recipe_book_ui/pages/show_recipe.dart';
import 'package:recipe_book_ui/recipe_data/requests.dart';

class RecipeListCard extends StatefulWidget {


  final String name;
  final int id;
  RecipeListCard({required this.name,required this.id});

  @override
  State<RecipeListCard> createState() => _RecipeListCardState(id: id,name: name);
}


class _RecipeListCardState extends State<RecipeListCard> {

  String name;
  int? id;
  _RecipeListCardState({required this.name, required int id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 110,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Card(
                    color: Colors.purple[700],
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 20, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowRecipe(id: widget.id)));
                    },
                    icon: Icon(Icons.remove_red_eye),
                    label: Text('Show'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                      minimumSize: MaterialStateProperty.all(Size(100, 25)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      BaseRecipe.deleteRecipe(widget.id.toString());
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.delete),
                    label: Text('Delete'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
                        minimumSize: MaterialStateProperty.all(Size(100, 25)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
