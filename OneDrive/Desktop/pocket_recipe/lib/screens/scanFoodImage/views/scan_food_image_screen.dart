import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/recipe/views/recipe_screen.dart';
import 'package:pocket_recipe/screens/scanFoodImage/controllers/scan_image_controller.dart';
import 'package:pocket_recipe/screens/scanFoodImage/views/components/image_display_container.dart';
import 'package:pocket_recipe/screens/scanFoodImage/views/components/image_scan_container.dart';
import 'package:sizer/sizer.dart';

class ScanFoodImageScreen extends StatelessWidget {
  const ScanFoodImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScanImageController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<ScanImageController>(
                  init: ScanImageController(),
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF3E2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50.h,
                      width: 100.w,
                      child: controller.image.value.path == ''
                          ? const ImageScanContainer()
                          : const ImageDisplayContainer(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
