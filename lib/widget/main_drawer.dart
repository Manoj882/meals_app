import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap:  onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile(
            title: 'Meals',
            icon: Icons.restaurant_outlined,
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            title: 'Filter',
            icon: Icons.settings_outlined,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);

            },
          ),
        ],
      ),
    );
  }
}
