import 'package:flutter/material.dart';

class RecipeListCard extends StatefulWidget {

  final String name;
  RecipeListCard({required this.name});

  @override
  State<RecipeListCard> createState() => _RecipeListCardState(name: name);
}


class _RecipeListCardState extends State<RecipeListCard> {

  String name;
  _RecipeListCardState({required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 110,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 150,
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
                      Navigator.pushNamed(context, '/show_recipe');
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
                    onPressed: () {},
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
