import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';

class IntroDotIndicator extends StatelessWidget {
  final bool isActive;

  const IntroDotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.goldColor : AppColors.goldColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}