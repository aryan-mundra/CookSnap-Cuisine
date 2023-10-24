import 'dart:developer';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/savedRecipes/controllers/saved_recipes_controller.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';
import 'package:sizer/sizer.dart';

class FoodImageContainer extends StatelessWidget {
  const FoodImageContainer({
    super.key,
    required this.foodImage,
    required this.isNetworkImage,
    required this.recipe, required this.localRecipe,
  });
  final dynamic foodImage;
  final bool isNetworkImage;
  final RecipeModel recipe;
  final bool localRecipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        image: isNetworkImage
            ? DecorationImage(
                image: NetworkImage(foodImage),
                fit: BoxFit.cover,
              )
            : DecorationImage(
                image: XFileImage(foodImage),
                fit: BoxFit.cover,
              ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    log("Back button pressed");
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              Visibility(
                visible: !localRecipe,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      Get.find<SavedRecipesController>().saveRecipe(recipe);
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
