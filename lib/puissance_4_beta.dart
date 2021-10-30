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
    var column_1 =[false,false,false,false,false,false];
    var column_2 =[false,false,false,false,false,false];
    var column_3 =[false,false,false,false,false,false];
    var column_4 =[false,false,false,false,false,false];
    var column_5 =[false,false,false,false,false,false];
    var column_6 =[false,false,false,false,false,false];
    var column_7 =[false,false,false,false,false,false];

    void onColumnClic(column){
      setState((){
        for(int i = 5; i >= 0; i--){
          if(column[i] == false){
            column[i] = true;
            break;
          }
        }
      });
    }

    grid_case(column_index){
      if(column_index == false){
        return Container( 
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ), 
            width: 50, 
            height: 50,
          );
      }else{
        return Container( 
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.green
            ), 
            width: 50, 
            height: 50,
          );
      }
    }

    grid_column(column){
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
              onPressed: () => onColumnClic(column),
            ),
          ),
          grid_case(column[0]), 
          grid_case(column[1]),
          grid_case(column[2]),
          grid_case(column[3]),
          grid_case(column[4]),
          grid_case(column[5])
        ];
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
          children: grid_column(column_1)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_2)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_3)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_4)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_5)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_6)
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(column_7)
        ),
      ]),
      );
  }
}