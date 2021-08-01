import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/categories_fixture.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular((10))),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
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
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index +1 )}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ))
            )
          ],
        ),
      ),
    );
  }
}
