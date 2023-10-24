import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/scanFoodImage/controllers/scan_image_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:cross_file_image/cross_file_image.dart';

class ImageDisplayContainer extends StatelessWidget {
  const ImageDisplayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<ScanImageController>(
        init: ScanImageController(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.isLoading.value
                    ? 'Please Wait...'
                    : 'Click Next to View the Recipe',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: XFileImage(
                      Get.find<ScanImageController>().image.value,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          Get.find<ScanImageController>().resetImage();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: GestureDetector(
                  onTap: () {
                    Get.find<ScanImageController>().getRecipes();
                  },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          );
        });
  }
}
