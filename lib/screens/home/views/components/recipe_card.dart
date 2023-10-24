import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/recipe/views/recipe_screen.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.prepTimeInMins,
    required this.backgroundImagePath,
    required this.dishImageUrl,
  });
  final RecipeModel recipe;
  final int prepTimeInMins;
  final String backgroundImagePath;
  final String dishImageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RecipeScreen(
              localRecipe: false,
              dishName: recipe.title,
              foodImage: dishImageUrl,
              isNetworkImage: true,
              ingredients: recipe.ingredients,
              instructions: recipe.recipe,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              backgroundImagePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$prepTimeInMins MINS',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Recipe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage(
                dishImageUrl,
              ),
              radius: 50,
            ),
          ],
        ),
      ),
    );
  }
}
