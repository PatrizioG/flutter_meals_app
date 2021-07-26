import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const String routeName = '/category-meals';

  //final String id;
  //final String title;
  //CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {

    var routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'] ?? 'Title'),
      ),
      body: Center(
        child: Text('The Recipes for the Category'),
      ),
    );
  }
}
