import 'dart:developer';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/login/repository/auth_repository.dart';


class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOtp(String otp) async {
    var isVerified = await AuthRepository.instance.verifyOtp(otp);
    isVerified
        ? log("Otp Verified")
        : Get.back();
  }
}
