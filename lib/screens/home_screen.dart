import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/common/app_colors.dart';
import 'package:islami_app/gen/assets.gen.dart';
import 'package:islami_app/tabs/hadith/hadith.dart';
import 'package:islami_app/tabs/quran/quran.dart';
import 'package:islami_app/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/tabs/sabha/sabha.dart';
import 'package:islami_app/tabs/time/time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget>taps = [
    Quran(),
    Hadith(),
    Sabha(),
    RadioTab(),
    Time(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        backgroundColor: AppColors.goldColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.wihteColor,
        unselectedItemColor: AppColors.blackColor,

        items: [
          _buildBottomNavItem(icon: (Assets.images.quran), label: "Quran"),
          _buildBottomNavItem(icon: (Assets.images.hadith), label: "Hadith"),
          _buildBottomNavItem(icon: (Assets.images.sabha), label: "Sabha"),
          _buildBottomNavItem(icon: (Assets.images.radio), label: "Radio"),
          _buildBottomNavItem(icon: (Assets.images.time), label: "Time"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        width:26,
        height: 26,
        colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66),
        ),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(AppColors.wihteColor, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}
