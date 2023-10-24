import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';

class SavedRecipesController extends GetxController {
  RxList<RecipeModel> savedRecipes = <RecipeModel>[].obs;

  void saveRecipe(RecipeModel recipe) {
    savedRecipes.add(recipe);
    Get.snackbar(
      "Recipe Saved",
      "You can view your saved recipes in the Saved Recipes tab",
      margin: const EdgeInsets.only(bottom: 8.0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    update();
  }
}
