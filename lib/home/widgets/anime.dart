import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugi/home/models/AnimeTMDB.dart';
import 'package:mugi/home/models/Content.dart';
import 'package:mugi/main.dart';
import '../data/data.dart';
import '../models/Anime.dart';
import '../screens/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AnimePage extends StatefulWidget {
  final String title;
  final String genre;

  AnimePage({required this.title, required this.genre});

  @override
  _AnimePageState createState() => _AnimePageState(title, genre);
}

class _AnimePageState extends State<AnimePage> {
  List<AnimeTMDB> lesAnimes = [];
  String title;
  String genre;

  _AnimePageState(this.title, this.genre);

  Future<void> getAnimes() async {
    var client = http.Client();
    try {
      var url = Uri();

      if (genre == "top") {
        url = Uri.parse(
            'https://api.themoviedb.org/3/discover/tv?api_key=61d165f130785bdd48afecc701be6a70&with_genres=16&vote_average.gte=8&language=fr&page=1');
      } else {
        var genre_id =
            lesGenres.firstWhere((element) => element['name'] == genre)['id'];
        url = Uri.parse(
            'https://api.themoviedb.org/3/discover/tv?api_key=61d165f130785bdd48afecc701be6a70&with_genres=16,' +
                '$genre_id' +
                '&language=fr&page=1');
      }
      var response = await client.get(url);
      var decodedResponse = convert.jsonDecode(response.body) as Map;
      final fetchedAnimes = (decodedResponse['results'] as List)
          .map((anime) => AnimeTMDB.fromJson(anime))
          .toList();
      print(fetchedAnimes);

      setState(() {
        lesAnimes = fetchedAnimes;
      });
    } catch (err) {
      print(err);
      client.close();
    }
  }

  @override
  void initState() {
    getAnimes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lesAnimes.length,
            itemBuilder: (BuildContext context, int index) {
              AnimeTMDB anime = lesAnimes[index];
              return GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(
                            anime: anime,
                          ),
                        ),
                      ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 240.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 240.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    anime.name!,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    'rating: ${anime.vote_average}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 220.0,
                              image: NetworkImage(anime.poster_path!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
