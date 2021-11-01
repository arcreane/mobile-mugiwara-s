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
    var allColumn =[
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      [[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor],[false, MaterialColor]],
      ];
    var player = "player_1";
    MaterialColor player_color = Colors.green;

    verticalUpVerification(column, y, color){
      int vic_point = 1;
      for(int i = 1; i < 4; i++){
        if(i + y > 5){
          return false;
        }else if(column[y + i][0] == true && column[y + i][1] == color){
          vic_point += 1;
        }else{
          return false;
        }
      }
      if(vic_point >= 4){
        return true;
      }
    }

    verticalRawVerification(column, x, y, color){
      int vic_point = 1;
      for(int i = 1; i < 4; i++){
        if(i + x > 6){
          return false;
        }else if(column[x + i][y][0] == true && column[x + i][y][1] == color){
          vic_point += 1;
        }else{
          return false;
        }
      }
      if(vic_point >= 4){
        return true;
      }
    }

    verticalUpLeftVerification(column, x, y, color){
      int vic_point = 1;
      for(int i = 1; i < 4; i++){
        if(i + x > 6 || i + y > 5){
          return false;
        }else if(column[x + i][y + i][0] == true && column[x + i][y + i][1] == color){
          vic_point += 1;
        }else{
          return false;
        }
      }
      if(vic_point >= 4){
        return true;
      }
    }
    
    verticalUpRightVerification(column, x, y, color){
      int vic_point = 1;
      for(int i = 1; i < 4; i++){
        if(i + x > 6 || i + y > 5 || x - i < 0){
          return false;
        }else if(column[x - i][y + i][0] == true && column[x - i][y + i][1] == color){
          vic_point += 1;
        }else{
          return false;
        }
      }
      if(vic_point >= 4){
        return true;
      }
    }

    victoryVerification(column){
      for(int x = 0; x <= 6; x++){
        for(int y = 0; y <= 5; y++){
          if(column[x][y][0] == true){
            if(verticalUpVerification(column[x], y, column[x][y][1]) == true || verticalRawVerification(column, x, y, column[x][y][1]) == true || verticalUpLeftVerification(column, x, y, column[x][y][1]) == true || verticalUpRightVerification(column, x, y, column[x][y][1]) == true){
              if(column[x][y][1] == Colors.orange){
                return [true, "Victoire du joueur orange"];
              }else{
                return [true, "Victoire du joueur vert"];
              }
            }
          }
        }
      }
      return [false, "aucun gagnant"];
    }

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
        var victory = victoryVerification(allColumn);
        if(victory[0] == true){
          print(victory[1]);
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
              onPressed: () {
                onColumnClic(column);
                print("boutton appuyé");
              }
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
          children: grid_column(allColumn[0])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[1])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[2])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[3])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[4])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[5])
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid_column(allColumn[6])
        ),
      ]),
      );
  }
}