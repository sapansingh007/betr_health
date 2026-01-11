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
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3A255F),width: 2),
            borderRadius: BorderRadius.circular(18),
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3A255F).withOpacity(0.6),
                Color(0xFF3A255F).withOpacity(0.6),
                // Color(0xFF3A255F),
                // Color(0xFF24123F),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(-2, -2),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(4, 6),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
