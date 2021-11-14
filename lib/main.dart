import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:mugi/home/models/Content.dart';
import 'package:mugi/home/models/User.dart';
import 'package:mugi/home/screens/home_screen.dart';
import './login.dart';
import './signup.dart';
import './home/ui/main.dart';

import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GlobalState());

    return MaterialApp(
      title: 'JustAnimes',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class GlobalState extends GetxController {
  User user = User.empty();

  void setUser(User unUser) {
    user = unUser;
    update();
  }

  void AddContentToWatchList(Content c) {
    user.watch_list?.add(c);
    update();
  }
}
