import 'package:flutter/material.dart';

class RecipeListCard extends StatefulWidget {
  const RecipeListCard({Key? key}) : super(key: key);

  @override
  State<RecipeListCard> createState() => _RecipeListCardState();
}

class _RecipeListCardState extends State<RecipeListCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 110,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 5, 0),
                child: Text(
                  'Recipe1',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 20, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.local_restaurant),
                    label: Text('Show'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
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
