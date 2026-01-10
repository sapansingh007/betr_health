import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_spacing.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String iconPath;
  final bool obscure;
  final TextEditingController controller;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.iconPath,
    this.obscure = false,
    required this.controller,
    this.suffix,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool get isFocused => _focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      decoration: BoxDecoration(
        color: isFocused
            ? AppColors.fieldFill.withOpacity(0.95)
            : AppColors.fieldFill.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: isFocused
            ? Border.all(color: AppColors.fieldBorder, width: 1.2)
            : null,
        boxShadow: isFocused
            ? [
          BoxShadow(
            color: AppColors.fieldBorder.withOpacity(0.45),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ]
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(widget.iconPath, width: 22),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: widget.controller,
              obscureText: widget.obscure,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
              ),
              cursorColor: AppColors.fieldBorder,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: AppColors.hint),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.suffix != null) widget.suffix!,
        ],
      ),
    );
  }
}

