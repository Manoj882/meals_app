import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryItem({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
