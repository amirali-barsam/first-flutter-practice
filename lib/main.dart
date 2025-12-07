import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test/article.dart';
import 'package:test/home.dart';
import 'package:test/profile.dart';
import 'package:test/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          headlineMedium: TextStyle(fontSize: 20, color: secondaryTextColor),
          headlineSmall: TextStyle(
            fontSize: 18,
            color: secondaryTextColor,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(fontSize: 12, color: secondaryTextColor),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 20, color: primaryTextColor),
          labelSmall: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ).apply(fontFamily: 'Avenir'),
      ),
      home: ProfileScreen(),
      // home: SplashScreen(),
      // home: Stack(
      //   children: [
      //     Positioned.fill(child: const HomeScreen()),
      //     Positioned(left: 0, right: 0, bottom: 0, child: _BottomNavBarItem()),
      //   ],
      // ),
    );
  }
}
