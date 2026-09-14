import 'package:flutter/material.dart';
import 'package:islami_app/common/app_theme.dart';
import 'package:islami_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mariam Tarek',
      theme: AppTheme.appTheme,
      home: HomeScreen(),

    );
  }
}

