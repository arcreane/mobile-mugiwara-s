/**
 * Author: Ambika Dulal
 * profile: https://github.com/Ambikadulal
 * design Source:Dribble.com
 * Images:Pixabay.com
  */
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class HomePage extends StatelessWidget {
  static const String path = 'lib/home/main.dart';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}
