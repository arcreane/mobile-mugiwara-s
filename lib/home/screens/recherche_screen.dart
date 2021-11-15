// ignore_for_file: prefer_const_constructor
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
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

  List top_movies = [];
  List search_movies = [];
  final String api_key = 'ae5ba588523ae802dd1c32820424ac1d';
  final access_token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZTViYTU4ODUyM2FlODAyZGQxYzMyODIwNDI0YWMxZCIsInN1YiI6IjYxODg0YjljZDM4OGFlMDA4YTE2Mzk3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8YM5r5gMP5kwSSxM1rO9tBMTdVu9nSk9JcEr2bfLHlY';

  @override
  void initState(){
    loadTopMovies();
    super.initState();
  }

  loadTopMovies()async{
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(api_key, access_token),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true
    ));
    // for(int i = 1; i <= 3; i++){
    //   Map loaded_top_movies = await tmdbwithcustomlogs.v3.movies.getTopRated(page:i);
    // }
    Map loaded_top_movies = await tmdbwithcustomlogs.v3.movies.getTopRated(page:1);
    // Map loaded_search_movies = await tmdbwithcustomlogs.v3.search.queryKeywords("naruto");
    Map loaded_search_movies = await tmdbwithcustomlogs.v3.movies.getLists(279734);

    setState(() {
      top_movies = loaded_top_movies["results"];
      search_movies = loaded_search_movies["results"];
    });
    print(search_movies);
  }

  getTitle(Map listfilm){
    int i = 0;
    List custom_listfilm = [];
    listfilm.forEach((key, value){
      if(key == "results"){
        for(var film in listfilm[key]){
          custom_listfilm.add(film["title"]);
        }
      }
    });
    return custom_listfilm;
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
          Container(
            child:TextField(
              decoration: InputDecoration(
                hintText: "Recherche"
              ),
            )
          ),
          Topmovies(topmovies: top_movies)
        ]
      )
    );
  }

}