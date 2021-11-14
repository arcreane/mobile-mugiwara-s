import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mugi/home/models/User.dart';
import 'package:mugi/home/ui/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mugi/main.dart';

Color blueColors = Color(0xff000000);
Color blueLightColors = Color(0xff000000);

class SignUpPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<SignUpPage> {
  String email = "";
  String mdp = "";
  String nom = "";
  String prenom = "";

  void inscription(BuildContext context) async {
    if (email != "" && mdp != "" && nom != "" && prenom != "") {
      var client = http.Client();
      try {
        var url = Uri.parse('http://127.0.0.1:8000/api/create-user/');
        var response = await client.post(url,
            body: {'mail': email, 'mdp': mdp, 'prenom': prenom, 'nom': nom});
        var decodedResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        print(decodedResponse);
        if (response.statusCode == 201) {
          User u = User.fromJson(decodedResponse);
          final GlobalState ctrl = Get.find();
          ctrl.setUser(u);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        }
        ;
      } catch (err) {
        print(err);
        client.close();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Inscrivez-vous"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        hint: "Entrez votre nom",
                        icon: Icons.account_box,
                        onChanged: (text) => nom = text),
                    _textInput(
                        hint: "Entrez votre prénom",
                        icon: Icons.account_box,
                        onChanged: (text) => prenom = text),
                    _textInput(
                        hint: "Entrez votre Email",
                        icon: Icons.email,
                        onChanged: (text) => email = text),
                    _textInput(
                        hint: "Mot de passe",
                        icon: Icons.vpn_key,
                        onChanged: (text) => mdp = text),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                    ),
                    const SizedBox(height: 60.0),
                    RaisedButton(
                      padding: const EdgeInsets.all(32.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120.0)),
                      color: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () => inscription(context),
                      child: Text("S'inscrire"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, onChanged}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  var text = "Connectez-vous";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [blueColors, blueLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: Image.asset(
              "assets/logo/JustAnime_Logo.png",
              height: 4500,
              width: 4500,
            ),
          ),
        ],
      ),
    );
  }
}
