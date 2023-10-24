import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/bottomNavbar/views/bottom_navbar.dart';
import 'package:pocket_recipe/screens/savedRecipes/controllers/saved_recipes_controller.dart';
import 'package:pocket_recipe/services/api_service.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthRepository());
    Get.put(SavedRecipesController());
    Get.put(ApiService());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.grey,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const BottomNavBar(
            initailIndex: 0,
          ),
          // home: const RecipeListScreen(),
        );
      },
    );
  }
}
