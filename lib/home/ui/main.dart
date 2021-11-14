/**
 * Author: Ambika Dulal
 * profile: https://github.com/Ambikadulal
 * design Source:Dribble.com
 * Images:Pixabay.com
  */
import 'package:flutter/material.dart';
import 'package:mugi/login.dart';
import 'package:mugi/main.dart';
import '../screens/home_screen.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const String path = 'lib/home/main.dart';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalState ctrl = Get.find();

    if (ctrl.user.id != null) {
      return MaterialApp(
        title: 'Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: HomeScreen(),
      );
    } else {
      return MaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: LoginPage(),
      );
    }
  }
}
