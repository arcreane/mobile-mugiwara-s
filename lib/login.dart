import 'package:flutter/material.dart';
import 'package:mugi/home/models/User.dart';
import './home/screens/home_screen.dart';
import 'package:mugi/main.dart';
import './signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:get/get.dart';

Color blueColors = Color(0xff000000);
Color blueLightColors = Color(0xff000000);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String mdp = "";

  void seConnecter(BuildContext context) async {
    if (email != "" && mdp != "") {
      var client = http.Client();
      try {
        var url = Uri.parse('http://127.0.0.1:8000/api/login/');
        print(url);
        var response =
            await client.post(url, body: {'mail': email, 'mdp': mdp});
        var decodedResponse = convert.jsonDecode(response.body) as Map;
        if (response.statusCode == 200) {
          User u = User.fromJson(decodedResponse['user']);
          final GlobalState ctrl = Get.find();
          ctrl.setUser(u);
          print(ctrl);
          print(u);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomeScreen(),
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
            HeaderContainer("Connectez-vous"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        hint: "Entrez votre Email",
                        icon: Icons.email,
                        obscureText: false,
                        onChanged: (text) => email = text),
                    _textInput(
                        hint: "Mot de passe",
                        obscureText: true,
                        icon: Icons.vpn_key,
                        onChanged: (text) => mdp = text),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Mot de passe oublié ?",
                      ),
                    ),
                    const SizedBox(height: 60.0),
                    RaisedButton(
                      padding: const EdgeInsets.all(32.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120.0)),
                      color: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () => seConnecter(context),
                      child: Text("Se Connecter"),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpPage(),
                              ),
                            ),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Vous n'avez encore de compte ? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Inscrivez-vous",
                                style: TextStyle(color: blueColors)),
                          ]),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, onChanged, obscureText}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
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
