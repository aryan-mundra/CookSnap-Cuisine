import 'package:flutter/material.dart';
import 'package:pocket_recipe/screens/recipe/views/components/food_image_container.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen(
      {super.key,
      required this.dishName,
      required this.foodImage,
      required this.ingredients,
      required this.instructions,
      required this.isNetworkImage, required this.localRecipe});
  final String dishName;
  final dynamic foodImage;
  final List<String> ingredients;
  final List<String> instructions;
  final bool isNetworkImage;
  final bool localRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodImageContainer(
              recipe: RecipeModel(
                ingredients: ingredients,
                recipe: instructions,
                title: dishName,
              ),
              foodImage: foodImage,
              isNetworkImage: isNetworkImage,
              localRecipe: localRecipe,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              ingredients[index],
                            ),
                          ),
                        );
                      },
                      itemCount: ingredients.length,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...instructions.map(
                    (e) => Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "▪️ $e",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
