import 'package:flutter/material.dart';
import 'package:genshin_impact_character/screens/welcome_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomPage(),
      routes: {
        WelcomPage.welcomeRoute: (context) => const WelcomPage(),
        HomePage.homeRoute: (context) => HomePage(),
      },
    );
  }
}
