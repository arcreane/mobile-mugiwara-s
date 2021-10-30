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

    grid_column(){
        return <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ), 
            width: 50, 
            height: 25,
            child:
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(""), 
              onPressed: () {},
            ),
          ),
          Container( 
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ), 
            width: 50, 
            height: 50,
            ), 
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            width: 50,
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            width: 50,
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            width: 50,
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column()
        ),
      ]),
      );
  }
}