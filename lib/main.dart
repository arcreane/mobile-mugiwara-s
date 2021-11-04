import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './login.dart';
import './signup.dart';
import './home/ui/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JustAnimes',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
        ),
      ),
      home: LoginPageFourteen(),
    );
  }
}
