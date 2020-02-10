import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = 'categories-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    String categoryTitle = routeArgs['title'];
    String categoryId = routeArgs['id'];

    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: filteredMeals[index].id,
            title: filteredMeals[index].title,
            imgUrl: filteredMeals[index].imageUrl,
            affordability: filteredMeals[index].affordability,
            complexity: filteredMeals[index].complexity,
            duration: filteredMeals[index].duration,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
