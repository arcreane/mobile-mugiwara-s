import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugi/home/models/AnimeTMDB.dart';
import 'package:mugi/home/models/Content.dart';
import 'package:mugi/main.dart';
import '../models/Anime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WatchList extends StatefulWidget {
  final AnimeTMDB? anime;

  WatchList({Key? key, this.anime}) : super(key: key);

  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  final GlobalState ctrl = Get.find();
  final _biggerFont = const TextStyle(fontSize: 18); // NEW
  List<Content> watchList = [];

  @override
  void initState() {
    watchList = ctrl.user.watch_list!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votre Watch List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: watchList.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(watchList[i]);
        });
  }

  Widget _buildRow(Content c) {
    return ListTile(
      title: Text(
        c.name!,
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.favorite,
        color: Colors.red,
        semanticLabel: 'Remove from saved',
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {});
      },
    );
  }
}
