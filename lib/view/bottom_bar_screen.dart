import 'package:chatbot_template/controller/bottom_bar_controller.dart';
import 'package:chatbot_template/view/home_screen.dart';
import 'package:chatbot_template/view/profile_screen.dart';
import 'package:chatbot_template/view/settings_screen.dart';
import 'package:chatbot_template/view/trending_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
   BottomBarScreen({super.key});

  final List<Map<String, dynamic>> _pages =  [
    {'title': 'Home', 'screen': const HomeScreen()},
    {'title': 'Profile', 'screen': const ProfileScreen()},
    {'title': 'Trending', 'screen': const TrendingScreen()},
    {'title': 'Settings', 'screen': SettingsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (controller) {
          return Scaffold(
            body: _pages[controller.currentIndex]['screen'],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex,
              onTap: controller.selectedPage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department_rounded),
                  label: 'Trending',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
        });
  }
}
