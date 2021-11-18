// ignore_for_file: prefer_const_constructors, prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          onPrimary: Colors.white,
          primary: Colors.red.shade400,
          padding: EdgeInsets.symmetric(horizontal: 42, vertical: 32),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}
