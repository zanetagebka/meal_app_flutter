import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? mealName = routeArgs['title'];
    final String? mealId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mealName!),
      ),
      body: Center(
        child: Text(mealId!),
      ),
    );
  }
}
