import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipe/constants/api.dart';
import 'package:pocket_recipe/screens/recipeList/views/recipe_list_screen.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';
import 'package:pocket_recipe/screens/scanFoodImage/repository/scan_food_repository.dart';

class ScanImageController extends GetxController {
  //* Variables

  var image = XFile('').obs;
  final ImagePicker picker = ImagePicker();
  RxList<RecipeModel> recipeList = RxList<RecipeModel>();
  RxBool isLoading = false.obs;

  //* Functions
  void pickImage({required ImageSource imageSource}) async {
    final XFile? pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      log(pickedImage.path);
      image.value = pickedImage;
      log(image.value.path);
      log(image.value.name);
      update();
    }
  }

  void resetImage() {
    image.value = XFile('');
    recipeList.clear();
    update();
  }

  void test() async {
    ApiResponse testResponse = await ScanFoodRepository.instance.test();
    log(testResponse.data.toString());
  }

  void getRecipes() async {
    isLoading.value = true;
    ApiResponse response =
        await ScanFoodRepository.instance.getRecipe(image: image.value);
    isLoading.value = false;
    if (response.message == ApiMessage.success) {
      recipeList.value = response.data;
      log(recipeList.toString());
      Get.to(() => RecipeListScreen(
            recipeList: recipeList,
            image: image.value,
          ));
    } else if (response.data == 'Not a valid recipe!') {
      Get.snackbar('Error', 'Recipe Not Found ', backgroundColor: Colors.red);
    } else {
      Get.snackbar('Error', 'Network Error', backgroundColor: Colors.red);
    }
  }
}
