// ignore_for_file: prefer_const_constructor
import 'dart:html';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "MyApp",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: titre()
      );
  }
}


class titre extends StatefulWidget{
  @override 
  _titreState createState() => _titreState();
}

class _titreState extends State<titre>{
    var mot = "test";

    pairColumn(){
        return [
          Container( 
            color: Colors.blue, 
            width: 50, 
            height: 50,
            ), 
          Container(
            color: Colors.orange,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.orange,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
        ];
    }

    void clicOnTest(){
      setState((){
        mot = "Le bouton a été cliqué";
      });
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mot),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(//Column 1
          children: pairColumn()
        ),
        Column(
          children: [
            Container(
              color: Colors.orange,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ]),
      );
  }
}