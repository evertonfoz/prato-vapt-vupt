import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const RecipeCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
