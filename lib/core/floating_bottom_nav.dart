import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/bottom_nav/controllers/bottom_nav_controller.dart';

class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Bar
        Container(
          height: 72,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Obx(() {
            controller.currentIndex.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: 'assets/png/icons/home.png',
                  index: 0,
                  controller: controller,
                ),
                _NavItem(
                  icon: 'assets/png/icons/goals.png',
                  index: 1,
                  controller: controller,
                ),
                const SizedBox(width: 48), // space for +
                _NavItem(
                  icon: 'assets/png/icons/feed.png',
                  index: 2,
                  controller: controller,
                ),
                _NavItem(
                  icon: 'assets/png/icons/settings.png',
                  index: 3,
                  controller: controller,
                ),
              ],
            );
          },),
        ),

        // Floating Plus Button
        Positioned(
          bottom: 36,
          child: GestureDetector(
            onTap: () {
              // open create modal / screen
            },
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE54312),
                    Color(0xFFDE292F),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _NavItem extends StatelessWidget {
  final String icon;
  final int index;
  final BottomNavController controller;

  const _NavItem({
    required this.icon,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFEF4B2D).withOpacity(0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Image.asset(
          icon,
          height: 24,
          color: isActive
              ? const Color(0xFFEF4B2D)
              : Colors.grey,
        ),
      ),
    );
  }
}
