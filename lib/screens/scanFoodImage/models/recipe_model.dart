import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pocket_recipe/utils/helper_model.dart';

class RecipeModel {
  final List<String> ingredients;
  final List<String> recipe;
  final String title;
  RecipeModel({
    required this.ingredients,
    required this.recipe,
    required this.title,
  });
  static final helper = HelperModel(
    (map) => RecipeModel.fromMap(map),
  );

  RecipeModel copyWith({
    List<String>? ingredients,
    List<String>? recipe,
    String? title,
  }) {
    return RecipeModel(
      ingredients: ingredients ?? this.ingredients,
      recipe: recipe ?? this.recipe,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ingredients': ingredients,
      'recipe': recipe,
      'title': title,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      ingredients: List<String>.from(map['ingredients']),
      recipe: List<String>.from(map['recipe']),
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RecipeModel(ingredients: $ingredients, recipe: $recipe, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeModel &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.recipe, recipe) &&
        other.title == title;
  }

  @override
  int get hashCode => ingredients.hashCode ^ recipe.hashCode ^ title.hashCode;
}
