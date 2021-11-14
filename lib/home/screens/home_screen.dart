import 'package:flutter/material.dart';
import 'package:mugi/home/screens/watch_list.dart';
import '../widgets/anime.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final List _children = [HomeTabWidget(), WatchList()];
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _children[_currentTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.watch_later,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 30.0),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

class HomeTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            'What would you like to find?',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        SizedBox(height: 20.0),
        AnimePage(title: "Top Animes", genre: "top"),
        SizedBox(height: 20.0),
        AnimePage(title: "Action & Aventure", genre: "Action & Adventure"),
        SizedBox(height: 20.0),
        AnimePage(title: "Comédies", genre: "Comedy"),
      ],
    );
  }
}
