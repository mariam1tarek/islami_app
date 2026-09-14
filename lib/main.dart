import 'package:flutter/material.dart';
import 'package:islami_app/common/app_theme.dart';
import 'package:islami_app/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        home: IntroScreen(),

    );
  }
}

