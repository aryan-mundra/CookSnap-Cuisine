import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_recipe/screens/home/views/home_screen.dart';
import 'package:pocket_recipe/screens/profile/views/profile_screen.dart';
import 'package:pocket_recipe/screens/savedRecipes/views/saved_recipes_screen.dart';
import 'package:pocket_recipe/screens/scanFoodImage/views/scan_food_image_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.initailIndex}) : super(key: key);
  final int initailIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  //controller to manage different tabs of the navbar
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initailIndex);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //custom made tabview used as bottom navbar
        bottomNavigationBar: CustomNavBarWidget(tabController: _tabController),
        body: TabBarView(
          controller: _tabController,
          //tab pages in correspondence to the navbar
          children: const [
            HomeScreen(),
            ScanFoodImageScreen(),
            SavedRecipesScreen(),
            ProfileScreen()
          ],
        ));
  }
}

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    //outer container to hold the navbar
    return SizedBox(
      // padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(0.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.5.w),
          color: Colors.white,
          child: TabBar(
            unselectedLabelColor: Colors.white,
            //indicator package for the dot indication
            indicator: DotIndicator(
              color: Colors.black,
              distanceFromCenter: 20,
              radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
            // BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
            //inner padding for the icons of the navbar
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/bottomNavbar/home1.svg",
                  color: Colors.black,
                  height: 22,
                  width: 22,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/bottomNavbar/search.svg",
                  color: Colors.black,
                  height: 22,
                  width: 22,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/bottomNavbar/bookmark.svg",
                  color: Colors.black,
                  height: 22,
                  width: 22,
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/bottomNavbar/profile1.svg",
                  color: Colors.black,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
