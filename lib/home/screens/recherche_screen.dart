// ignore_for_file: prefer_const_constructor
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:mugi/home/models/AnimeTMDB.dart';
import 'package:mugi/home/models/Content.dart';
import 'package:mugi/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../widgets/recherche.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Recherche",
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override

  List<AnimeTMDB> search_anime = [];
  var result_page;
  TextEditingController recherche = TextEditingController();

  @override
  void initState(){
    find_anime("");
    super.initState();
  }

  find_anime(String word)async{
    // for(int i = 1; i <= 3; i++){
    //   Map loaded_top_movies = await tmdbwithcustomlogs.v3.movies.getTopRated(page:i);
    // }
    // Map loaded_top_movies = await tmdbwithcustomlogs.v3.movies.getTopRated(page:1);
    var client = http.Client();
    var url = Uri.parse('https://api.themoviedb.org/3/search/tv?api_key=61d165f130785bdd48afecc701be6a70&with_genres=16&language=fr&query='+word+'&page=1');
    var response = await client.get(url);
    var decodedResponse = convert.jsonDecode(response.body) as Map;
    final fetchedAnimes = (decodedResponse['results'] as List).map((anime) => AnimeTMDB.fromJson(anime)).toList();

    setState(() {
      search_anime = fetchedAnimes;
      result_page = search_anime_result(list_anime: search_anime);
    });
    print(search_anime);
    // print(anime_detail);
  }
// --------------------------------------------------------------------------------------------------------------------------

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bonjour"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 350,
                  child:TextField(
                  controller: recherche,
                  decoration: InputDecoration(
                    hintText: "Recherche"
                    ),
                  )
                ),
              ),
              Container(
                width:10,
                child: ElevatedButton(
                  onPressed: () {
                    print(recherche.text);
                    find_anime(recherche.text);
                  }, child: null,
                )
              )
            ]
          ),
          Container(
            child: result_page
          )
        ]
      )
    );
  }

}