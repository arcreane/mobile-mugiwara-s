// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/User_init_profil.dart';
import '../ui/user_preferences.dart';
import '../widgets/appbar.dart';
import '../widgets/button_widget.dart';
import '../widgets/profil_widget.dart';
import '../../login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildDisconnectButton()),
          const SizedBox(height: 24),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.prenom,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.mail,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildDisconnectButton() => ButtonWidget(
        text: 'Déconnecter',
        onClicked: () {
          print("object");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginPage(),
            ),
          );
        },
      );
}
