import 'package:flutter/material.dart';

class Recipedetail extends StatefulWidget {
  const Recipedetail({super.key});

  @override
  State<Recipedetail> createState() => _RecipedetailState();
}

class _RecipedetailState extends State<Recipedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(),
          ),
        ],
      ),
    );
  }
}
