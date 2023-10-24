import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/constants/fonts.dart';
import 'package:pocket_recipe/constants/sizing.dart';
import 'package:pocket_recipe/screens/login/controllers/login_controller.dart';
import 'package:pocket_recipe/screens/login/views/enter_otp.dart';
import 'package:pocket_recipe/screens/login/views/phone_input.dart';
import 'package:sizer/sizer.dart';

class EnterPhone extends StatelessWidget {
  EnterPhone({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: Colors.white,
                  height: 35,
                  width: 35,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 50.w,
                  child: Text(
                    'What\'s your phone number?',
                    style: title1.copyWith(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'We protect our community by making sure that everyone is real. We will never share your phone number with anyone else.',
                    style: subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                PhoneInputField(),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          controller.phoneAuthentication(
                            '+91 ${controller.phone.text.trim()}',
                          );
                          Get.to(() => EnterOtp());
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
