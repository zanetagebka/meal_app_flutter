import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        child: Text(text, style: Theme.of(context).textTheme.headline6));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? mealName = routeArgs['title'];
    final String? mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text(mealName!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child:
                      Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index]))),
                  itemCount: selectedMeal.ingredients.length)),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(children:
                [
                  ListTile(
                      leading: CircleAvatar(child: Text('# ${index + 1}')),
                      title: Text(selectedMeal.steps[index])),
                  const Divider()
                ]
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ));
  }
}
