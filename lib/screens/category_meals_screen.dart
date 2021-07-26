import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/categories_fixture.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  //final String id;
  //final String title;
  //CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
