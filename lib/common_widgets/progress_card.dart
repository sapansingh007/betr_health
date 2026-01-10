import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

import 'package:flutter/material.dart';

class ProgressStatCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const ProgressStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF2C1A4A),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: 26),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFB8AFC9),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
