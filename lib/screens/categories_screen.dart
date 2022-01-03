import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import 'package:meals_app/data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Food app')),
        body: GridView(
          children: DUMMY_CATEGORIES
              .map((catData) =>
              CategoryItem(title: catData.title, color: catData.color, id: catData.id))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          padding:  const EdgeInsets.all(25),
        )
    );
  }
}
