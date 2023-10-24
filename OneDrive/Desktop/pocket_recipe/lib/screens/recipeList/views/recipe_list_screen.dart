import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipe/screens/recipe/views/recipe_screen.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen(
      {super.key, required this.recipeList, required this.image});
  final List<RecipeModel> recipeList;
  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Relevant Recipes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return RecipeListTile(
                        image: image,
                        recipe: recipeList[index],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({
    super.key,
    required this.image,
    required this.recipe,
  });
  final XFile image;
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => RecipeScreen(
              dishName: recipe.title,
              foodImage: image,
              ingredients: recipe.ingredients,
              instructions: recipe.recipe,
              isNetworkImage: false,
              localRecipe: true,
            ));
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: XFileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          )),
      title: Text(
        recipe.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        recipe.ingredients.join(', ').toString(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 15,
      ),
    );
  }
}
