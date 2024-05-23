// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    ExtendedIngredient(
      id: (json['id'] as num).toInt(),
      aisle: json['aisle'] as String,
      image: json['image'] as String,
      consistency: json['consistency'] as String,
      name: json['name'] as String,
      nameClean: json['nameClean'] as String,
      original: json['original'] as String,
      originalName: json['originalName'] as String,
      amount: (json['amount'] as num).toDouble(),
      unit: json['unit'] as String,
      meta: (json['meta'] as List<dynamic>).map((e) => e as String).toList(),
    );
