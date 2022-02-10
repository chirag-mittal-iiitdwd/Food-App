import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  Widget buildSectionTitle(BuildContext context, String heading) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text("${SelectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(SelectedMeal.ingredients[index]),
                    ),
                    color: Theme.of(context).accentColor),
                itemCount: SelectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Reciepe'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      SelectedMeal.steps[index],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ]),
                itemCount: SelectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealID);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
