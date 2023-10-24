import 'package:flutter/material.dart';
import 'package:pocket_recipe/screens/home/views/components/recipe_card.dart';
import 'package:pocket_recipe/screens/home/views/components/top_row.dart';
import 'package:pocket_recipe/screens/scanFoodImage/models/recipe_model.dart';
import 'package:pocket_recipe/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopRow(
                name: 'Reshma',
                imageUrl: 'assets/images/profile.jpeg',
              ),
              SizedBox(
                height: 20,
              ),
              CustomSearchBar(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Popular Recipes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: data[index],
                        prepTimeInMins: index == 0 ? 30 : 45,
                        dishImageUrl: index == 0
                            ? 'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg'
                            : 'https://www.themealdb.com/images/media/meals/xxpqsy1511452222.jpg',
                        backgroundImagePath:
                            'assets/images/recipeBg/${index + 1}.png',
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List data = [
  RecipeModel(ingredients: [
    'Chicken',
    'Basmati Rice',
    'Onion',
    'Tomato',
    'Ginger',
    'Garlic',
    'Green Chilli',
    'Coriander Leaves',
    'Mint Leaves',
    'Curd',
    'Lemon',
    'Garam Masala',
    'Red Chilli Powder',
    'Turmeric Powder',
    'Coriander Powder',
    'Cumin Powder',
    'Salt',
    'Oil',
    'Water'
  ], recipe: [
    'Wash and soak the basmati rice for 30 minutes. Drain and set aside.',
    'Heat oil in a pan. Add the whole spices and saute for a few seconds.',
    'Add the sliced onions and saute till they turn golden brown.',
    'Add the ginger garlic paste and saute till the raw smell goes away.',
    'Add the chopped tomatoes and cook till they turn mushy.',
    'Add the chopped mint leaves and coriander leaves and saute for a minute.',
    'Add the curd and mix well. Cook for a minute.',
    'Add the red chilli powder, turmeric powder, coriander powder, cumin powder, garam masala powder and salt. Mix well and cook for a minute.',
    'Add the chicken pieces and mix well. Cook for 2-3 minutes.',
    'Add 1 cup of water and mix well. Cover and cook till the chicken is done.',
    'Add the soaked basmati rice and mix well. Add 1.5 cups of water and mix well. Cover and cook till the rice is done.',
    'Add the lemon juice and mix well. Switch off the flame.',
    'Serve hot with raita.'
  ], title: 'Chicken Biryani'),
  RecipeModel(ingredients: [
    'Matar',
    'Paneer',
    'Onion',
    'Tomato',
    'Ginger',
    'Garlic',
    'Green Chilli',
    'Coriander Leaves',
    'Mint Leaves',
    'Curd',
    'Lemon',
    'Garam Masala',
    'Red Chilli Powder',
    'Turmeric Powder',
    'Coriander Powder',
    'Cumin Powder',
    'Salt',
    'Oil',
    'Water'
  ], recipe: [
    'Wash and soak the basmati rice for 30 minutes. Drain and set aside.',
    'Heat oil in a pan. Add the whole spices and saute for a few seconds.',
    'Add the sliced onions and saute till they turn golden brown.',
    'Add the ginger garlic paste and saute till the raw smell goes away.',
    'Add the chopped tomatoes and cook till they turn mushy.',
    'Add the chopped mint leaves and coriander leaves and saute for a minute.',
    'Add the curd and mix well. Cook for a minute.',
    'Add the red chilli powder, turmeric powder, coriander powder, cumin powder, garam masala powder and salt. Mix well and cook for a minute.',
    'Add the chicken pieces and mix well. Cook for 2-3 minutes.',
    'Add 1 cup of water and mix well. Cover and cook till the chicken is done.',
    'Add the soaked basmati rice and mix well. Add 1.5 cups of water and mix well. Cover and cook till the rice is done.',
    'Add the lemon juice and mix well. Switch off the flame.',
    'Serve hot with raita.'
  ], title: 'Matar Paneer')
];
