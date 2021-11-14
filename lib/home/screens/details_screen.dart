import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugi/home/models/AnimeTMDB.dart';
import 'package:mugi/home/models/Content.dart';
import 'package:mugi/main.dart';
import '../models/Anime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailsScreen extends StatefulWidget {
  final AnimeTMDB? anime;

  DetailsScreen({Key? key, this.anime}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalState ctrl = Get.find();

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  // Future<bool> AnimeExistInWatchList() async {
  //   if(ctrl.user.watch_list.firstWhere((element) => ))
  // }

  Future<void> AddtoMyWatchlist(
      String name, String imageUrl, int tmdb_id) async {
    var client = http.Client();
    try {
      Content newContent =
          Content(id: 1, imageUrl: imageUrl, name: name, tmdb_id: tmdb_id);
      var url = Uri.parse('http://127.0.0.1:8000/api/watchlist/');
      var response = await client.post(url, body: {
        'userId': ctrl.user.id.toString(),
        'imageUrl': imageUrl,
        'tmdbId': tmdb_id.toString(),
        'name': name
      });
      ctrl.AddContentToWatchList(newContent);
    } catch (err) {
      print(err);
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.anime!.name!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(widget.anime!.backdrop_path!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.anime!.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5.0),
                        // Text(
                        //   widget.anime!.genre!,
                        //   style: TextStyle(
                        //     color: Colors.white70,
                        //     fontSize: 20.0,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                height: 170.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                    child: Column(children: <Widget>[
                      Text(
                        'Rating : ${widget.anime!.vote_average!}',
                        style: TextStyle(color: Colors.grey, fontSize: 22),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            widget.anime!.overview!,
                            style: TextStyle(color: Colors.grey, fontSize: 22),
                          )),
                      Spacer(),
                      RaisedButton(
                        padding: const EdgeInsets.all(32.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120.0)),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: () => AddtoMyWatchlist(widget.anime!.name!,
                            widget.anime!.poster_path!, widget.anime!.id!),
                        child: Text("ajouter"),
                      ),
                    ]))),
          ),
        ],
      ),
    );
  }
}
