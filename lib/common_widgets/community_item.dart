import 'package:flutter/material.dart';

class CommunityItem extends StatelessWidget {
  final String icon;
  final String label;

  const CommunityItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF2A1846),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.asset(icon, height: 30),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
