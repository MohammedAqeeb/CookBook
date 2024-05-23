import 'package:cookbook/app/data/keys/app_keys.dart';
import 'package:cookbook/models/recipe.dart';
import 'package:dio/dio.dart';

class RecipeDataProvider {
  Dio dio = Dio();

  String baseUrl = AppKeys.baseURL;
  String apiKey = AppKeys.apiKeys;

  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipe = [];

    try {
      final response = await dio.get(
          '$baseUrl/recipes/random?number=10&include-tags=chicken,desert',
          queryParameters: {
            'apiKey': apiKey,
          });

      if (response.statusCode == 200) {
        var recipes = response.data['recipes'];

        if (recipes.isNotEmpty) {
          for (var item in recipes) {
            recipe.add(Recipe.fromJson(item));
            print('total number');
            print(recipe.length);
          }
        }
      } else {
        throw Exception(
            'Failed to load recipes. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'Failed to load recipes. Status code: ${e.response!.statusCode}');
      } else {
        throw Exception('Failed to load recipes. Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load recipes. An unknown error occurred: $e');
    }
    return recipe;
  }
}
