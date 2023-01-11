import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    required this.favoriteMeals,
    super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
        return Center(
        child: Text('You have no favorites meal yet!. Start adding some'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
      );
    }
  }
}
