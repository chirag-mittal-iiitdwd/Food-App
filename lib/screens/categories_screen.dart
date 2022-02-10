import 'package:flutter/material.dart';
import 'package:food_app/widgets/category_item.dart';

// import './models/category.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (categoryData) => CategoryItem(
                categoryData.id, categoryData.color, categoryData.title),
          )
          .toList(),

      // Sliver in flutter is the scrollable area
      // GridDeligate takes care of the grid structuring
      // MaxCrossAxisAllignment = Maximum width for our object
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,

        // For 200 width i want 300 height
        childAspectRatio: 3 / 2,

        // Distace bwtten columns and rows in the grid
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
