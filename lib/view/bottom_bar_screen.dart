import 'package:newchatbot/controller/bottom_bar_controller.dart';
import 'package:newchatbot/view/home_screen.dart';
import 'package:newchatbot/view/profile_screen.dart';
import 'package:newchatbot/view/settings_screen.dart';
import 'package:newchatbot/view/trending_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  final List<Map<String, dynamic>> _pages = const [
    {'title': 'Home', 'screen': HomeScreen()},
    {'title': 'Profile', 'screen': ProfileScreen()},
    {'title': 'Trending', 'screen': TrendingScreen()},
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
