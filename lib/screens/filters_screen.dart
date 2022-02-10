import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FlitersScreen extends StatelessWidget {
  static const routeName = '/fliters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
