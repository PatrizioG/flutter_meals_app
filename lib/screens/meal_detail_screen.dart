import 'package:flutter/material.dart';

class MealDetailScreen extends StatefulWidget {
  static const String routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {

  @override
  Widget build(BuildContext context) {

    var id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(id)),
      body: Center(
        child: Text('The meal: $id'),
      ),
    );
  }
}
