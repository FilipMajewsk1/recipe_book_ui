import 'package:flutter/material.dart';
import 'package:recipe_book_ui/recipe_data/requests.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Recipe_Book",
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
          children: [
            Container(
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_recipe');
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

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  Navigator.pushNamed(context, '/recipe_list');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Recipe list",
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
    );
  }
}