import 'package:flutter/material.dart';
import 'package:recipeapp/services/api_service.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String recipeId;

  RecipeDetailScreen({required this.recipeId});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  final ApiService apiService = ApiService();
  Map<String, dynamic>? recipe;

  @override
  void initState() {
    super.initState();
    fetchRecipeDetails();
  }

  fetchRecipeDetails() async {
    recipe = await apiService.fetchRecipeDetails(widget.recipeId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe?['strMeal'] ?? 'Loading...')),
      body: recipe == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(recipe!['strMealThumb']),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recipe!['strMeal'],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(recipe!['strInstructions']),
                  ),
                ],
              ),
            ),
    );
  }
}
