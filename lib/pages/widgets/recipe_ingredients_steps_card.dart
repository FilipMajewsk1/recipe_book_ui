import 'package:flutter/material.dart';

class RecipeIngredientsStepsCard extends StatefulWidget {

  final String ingredientOrStep;
  RecipeIngredientsStepsCard({required this.ingredientOrStep});

  @override
  State<RecipeIngredientsStepsCard> createState() => _RecipeIngredientsStepsCardState(ingredientOrStep: ingredientOrStep);
}

class _RecipeIngredientsStepsCardState extends State<RecipeIngredientsStepsCard> {

  String ingredientOrStep;
  _RecipeIngredientsStepsCardState({required this.ingredientOrStep});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 60,
      child: Card(
        color: Colors.purple[700],
        child: Center(
          child: Text(
            widget.ingredientOrStep,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
