import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/models/intro_content.dart';

class IntroPageItem extends StatelessWidget {
  final IntroContent content;

  const IntroPageItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          content.imagePath,
          height: 320,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        Text(
          content.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'jannaLt',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.goldColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'jannaLt',
            fontSize: 14,
            color: AppColors.goldColor.withOpacity(0.8),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}