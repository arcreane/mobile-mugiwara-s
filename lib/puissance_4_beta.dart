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
    var column_1 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_2 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_3 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_4 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_5 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_6 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var column_7 =[[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]];
    var player = "player_1";
    MaterialColor player_color = Colors.green;

    void onColumnClic(column){
      setState((){
        if(player == "player_1"){
          player = "player_2";
          player_color = Colors.orange;
        }else{
          player = "player_1";
          player_color = Colors.green;
        }
        for(int i = 0; i <= 5; i++){
          if(column[i][0] == false){
            column[i][0] = true;     
            column[i][1] = player_color;
            break;
          }
        }
      });
    }

    grid_case(column_index, column_color){
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
              color: column_color,
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
          grid_case(column[5][0],column[5][1]), 
          grid_case(column[4][0],column[4][1]),
          grid_case(column[3][0],column[3][1]),
          grid_case(column[2][0],column[2][1]),
          grid_case(column[1][0],column[1][1]),
          grid_case(column[0][0],column[0][1])
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