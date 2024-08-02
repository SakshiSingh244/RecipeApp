import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  Future<List> fetchRandomRecipes() async {
    final response = await http.get(Uri.parse("${baseUrl}search.php?s="));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<Map<String, dynamic>> fetchRecipeDetails(String id) async {
    final response = await http.get(Uri.parse("${baseUrl}lookup.php?i=$id"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'][0];
    } else {
      throw Exception('Failed to load recipe details');
    }
  }

  Future<List> searchRecipes(String query) async {
    final response = await http.get(Uri.parse("${baseUrl}search.php?s=$query"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to search recipes');
    }
  }
}
