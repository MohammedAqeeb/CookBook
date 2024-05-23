// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      vegetarian: json['vegetarian'] as bool,
      vegan: json['vegan'] as bool,
      glutenFree: json['glutenFree'] as bool,
      dairyFree: json['dairyFree'] as bool,
      veryHealthy: json['veryHealthy'] as bool,
      cheap: json['cheap'] as bool,
      veryPopular: json['veryPopular'] as bool,
      sustainable: json['sustainable'] as bool,
      lowFodmap: json['lowFodmap'] as bool,
      weightWatcherSmartPoints:
          (json['weightWatcherSmartPoints'] as num).toInt(),
      gaps: json['gaps'] as String,
      preparationMinutes: json['preparationMinutes'],
      cookingMinutes: json['cookingMinutes'],
      aggregateLikes: (json['aggregateLikes'] as num).toInt(),
      healthScore: (json['healthScore'] as num).toInt(),
      creditsText: json['creditsText'] as String,
      sourceName: json['sourceName'] as String,
      pricePerServing: (json['pricePerServing'] as num).toDouble(),
      extendedIngredients:
          Helper.getExtendedIngredient(json['extendedIngredients'] as List?),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      readyInMinutes: (json['readyInMinutes'] as num).toInt(),
      servings: (json['servings'] as num).toInt(),
      sourceUrl: json['sourceUrl'] as String,
      image: json['image'] as String,
      imageType: json['imageType'] as String,
      summary: json['summary'] as String,
      cuisines:
          (json['cuisines'] as List<dynamic>).map((e) => e as String).toList(),
      dishTypes:
          (json['dishTypes'] as List<dynamic>).map((e) => e as String).toList(),
      diets: (json['diets'] as List<dynamic>).map((e) => e as String).toList(),
      occasions:
          (json['occasions'] as List<dynamic>).map((e) => e as String).toList(),
      instructions: json['instructions'] as String,
      originalId: json['originalId'],
      spoonacularScore: (json['spoonacularScore'] as num).toDouble(),
      spoonacularSourceUrl: json['spoonacularSourceUrl'] as String,
      license: json['license'] as String?,
    );
