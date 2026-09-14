import 'package:flutter/material.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/models/intro_content.dart';
import 'package:islami_app/widgets/intro_dot_indicator.dart';
import 'package:islami_app/widgets/intro_page_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<IntroContent> _screens = [
    IntroContent(
      imagePath: 'assets/images/img1.png',
      title: 'Welcome To Islmi App',
      description: '',
    ),
    IntroContent(
      imagePath: 'assets/images/img2.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    IntroContent(
      imagePath: 'assets/images/img3.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    IntroContent(
      imagePath: 'assets/images/img4.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    IntroContent(
      imagePath: 'assets/images/img5.png',
      title: 'Holy Quran Radio',
      description: 'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/Mosque.png',
                    height: 151,
                    width: 291,
                  ),
                  Positioned(
                    bottom: 0,
                    child: const Text(
                      'Islami',
                      style: TextStyle(
                        fontFamily: 'Kamali',
                        fontSize: 60,
                        color: AppColors.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _screens.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return IntroPageItem(content: _screens[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex > 0
                      ? TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'jannaLt',
                        fontSize: 16,
                        color: AppColors.goldColor,
                      ),
                    ),
                  )
                      : const SizedBox(width: 40),
                  Row(
                    children: List.generate(
                      _screens.length,
                          (index) => IntroDotIndicator(isActive: index == _currentIndex),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentIndex < _screens.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // الانتقال للشاشة الرئيسية
                      }
                    },
                    child: Text(
                      _currentIndex == _screens.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(
                        fontFamily: 'jannaLt',
                        fontSize: 16,
                        color: AppColors.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}