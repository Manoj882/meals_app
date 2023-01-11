import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widget/meal_item.dart';

import '../models/meal_model.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({
    required this.availableMeals,
    super.key});

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
        _loadedInitData = true;
    }
    
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
          );
        },
      ),
    );
  }
}
