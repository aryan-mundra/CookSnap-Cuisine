import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/home/views/components/recipe_card.dart';
import 'package:pocket_recipe/screens/savedRecipes/controllers/saved_recipes_controller.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetX<SavedRecipesController>(
              init: SavedRecipesController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Saved Recipes",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.savedRecipes.length,
                          itemBuilder: (context, index) {
                            return RecipeCard(
                              
                              recipe: controller.savedRecipes[index],
                              prepTimeInMins: 30,
                              backgroundImagePath:
                                  'assets/images/recipeBg/${(index / 2 + 1).ceil()}.png',
                              dishImageUrl: controller
                                          .savedRecipes[index].title ==
                                      'Chicken Biryani'
                                  ? 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg'
                                  : 'https://www.themealdb.com/images/media/meals/xxpqsy1511452222.jpg',
                            );
                          }),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
