import 'package:flutter/material.dart';
import 'package:my_vofo/view/page/main%20screens/home_screens.dart';
import 'package:my_vofo/view/page/on%20boarding%20screens/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My VoFo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
