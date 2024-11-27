import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/dashboard_controller.dart';
import 'package:pas1_mobile_11pplg2_11/pages/bottom_menu/favourite_menu.dart';
import 'package:pas1_mobile_11pplg2_11/pages/bottom_menu/home_menu.dart';
import 'package:pas1_mobile_11pplg2_11/pages/bottom_menu/profile_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [
      HomeMenu(),
      FavouriteMenu(),
      ProfileMenu(),
    ];

    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            toolbarHeight: 10,
            centerTitle: true,
          ),
          body: menus[dashboardController.selectedIndex.value],
          bottomNavigationBar: _navBar(dashboardController),
        );
      },
    );
  }
}

Widget _navBar(DashboardController dashboardController) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      color: const Color(0xff222831),
      borderRadius: BorderRadius.circular(16),
    ),
    child: ClipRRect(
      child: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff222831),
          selectedItemColor: const Color(0xff577EE1),
          unselectedItemColor: const Color(0xffEEEEEE),
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) => dashboardController.changeMenu(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    ),
  );
}
