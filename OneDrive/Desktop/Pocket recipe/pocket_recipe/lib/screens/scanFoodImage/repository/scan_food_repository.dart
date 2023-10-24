import 'dart:developer';
import 'package:get/get.dart' as getx;
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipe/constants/api.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';
import 'package:pocket_recipe/services/api_service.dart';
import 'package:dio/dio.dart';

class ScanFoodRepository {
  final _apiService = getx.Get.find<ApiService>();
  static final instance = ScanFoodRepository._();
  ScanFoodRepository._();

  Future<ApiResponse> test() async {
    final response = await _apiService.get('/');
    if (response.statusCode == 200) {
      log(response.data.toString());
      return ApiResponse(
        data: response.data["message"],
      );
    } else {
      return ApiResponse(
        data: null,
        message: ApiMessage.somethingWantWrongError,
      );
    }
  }

  Future<ApiResponse> getRecipe({XFile? image}) async {
    try {
      final response = await _apiService.post(
        '/',
        FormData.fromMap({
          "imagefile": await MultipartFile.fromFile(image!.path),
        }),
      );
      if (response.statusCode == 200) {
        if (response.data['message'] == 'Not a valid recipe!') {
          return ApiResponse(
            data: "Not a valid recipe!",
            message: ApiMessage.somethingWantWrongError,
          );
        }
        List<RecipeModel> recipeList = <RecipeModel>[];
        recipeList = RecipeModel.helper.fromMapArray(response.data['data']);
        return ApiResponse(
          message: ApiMessage.success,
          data: recipeList,
          dataCount: response.data['count'],
        );
      }
    } catch (e) {
      log("Error: ${e.toString()}");
    }
    return ApiResponse(
      data: null,
      message: ApiMessage.somethingWantWrongError,
    );
  }
}
