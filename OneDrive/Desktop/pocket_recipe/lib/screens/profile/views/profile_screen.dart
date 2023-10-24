import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_recipe/screens/profile/views/components/profile_list_tile.dart';
import 'package:pocket_recipe/screens/savedRecipes/views/saved_recipes_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Reshma S',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '+91 7397830280',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SavedRecipesScreen());
                  },
                  child: ProfileListTile(
                    title: 'Saved Recipes',
                    iconColor: Colors.red,
                    icon: Icons.favorite,
                  ),
                ),
                ProfileListTile(
                  title: 'Help and Support',
                  iconColor: Colors.lightBlue,
                  icon: Icons.help,
                ),
                ProfileListTile(
                  title: 'Logout',
                  iconColor: Colors.red,
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
