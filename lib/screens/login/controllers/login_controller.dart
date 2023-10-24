import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/login/repository/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final phone = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}
