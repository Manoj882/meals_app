import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filter Data'),
      ),
    );
  }
}
