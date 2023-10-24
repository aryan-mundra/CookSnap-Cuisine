
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocket_recipe/screens/scanFoodImage/controllers/scan_image_controller.dart';

class ImageScanContainer extends StatelessWidget {
  const ImageScanContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload your Image',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'PNG, JPG and JPEG files are allowed',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xffFA9884),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.find<ScanImageController>()
                          .pickImage(imageSource: ImageSource.camera);
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xffFA9884),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.find<ScanImageController>().pickImage(
                          imageSource: ImageSource.gallery);
                    },
                    child: Icon(
                      Icons.image,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
