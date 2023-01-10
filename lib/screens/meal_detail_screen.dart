import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';
  const MealDetailScreen({super.key});

  Widget buildSectionTiile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTiile(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTiile(context, 'Steps'),
            buildContainer(
              child: ListView.separated(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
