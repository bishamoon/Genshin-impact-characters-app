
import 'package:flutter/material.dart';
import 'package:genshin_impact_character/screens/home_page.dart';
import 'package:genshin_impact_character/widgets/button.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);
  static const String welcomeRoute = '/wel';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      bottom: true,
      child: Stack(
        children: [
          Image(
            image: const AssetImage(
              'assets/images/p1.jpg',
            ),
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 600,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Button(
                      color: const Color.fromARGB(255, 66, 75, 136),
                      title: "Lest's Go",
                      onpressed: () {
                        Navigator.pushNamed(context, HomePage.homeRoute);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
