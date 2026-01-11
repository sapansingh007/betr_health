import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/bottom_nav/controllers/bottom_nav_controller.dart';

class FloatingBottomNav extends StatelessWidget {
  FloatingBottomNav({super.key});

  final controller = Get.put(BottomNavController());

  final icons = [
    'assets/png/icons/home.png',
    'assets/png/icons/goals.png',
    'assets/png/icons/feed.png',
    'assets/png/icons/settings.png',
  ];

  final labels = ['Home', 'Goals', 'Feed', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBottomNavigationBar.builder(
        itemCount: icons.length,
        tabBuilder: (index, isActive) {
          final color = isActive
              ? const Color(0xFF5B2C83)
              : Colors.grey.shade500;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icons[index],
                width: 22,
                height: 22,
                color: isActive ? null : Colors.grey.shade500,
              ),
              const SizedBox(height: 6),
              Text(
                labels[index],
                style: TextStyle(
                  fontSize: 11,
                  color: color,
                  fontWeight:
                  isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          );
        },
        activeIndex: controller.currentIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 28,
        rightCornerRadius: 28,
        height: 70,
        backgroundColor: Colors.white,
        shadow: BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 22,
          offset: const Offset(0, 10),
        ),
        onTap: controller.changeIndex,
      );
    });
  }
}
