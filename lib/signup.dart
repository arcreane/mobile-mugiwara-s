import 'package:flutter/material.dart';

Color blueColors = Color(0xff000000);
Color blueLightColors = Color(0xff000000);

class SignUpPageFourteen extends StatefulWidget {
  static final String path = "lib/src/pages/signup/signup14.dart";
  @override
  _signupPageFourteenState createState() => _signupPageFourteenState();
}

class _signupPageFourteenState extends State<SignUpPageFourteen> {
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
                    _textInput(hint: "Entrez votre nom"),
                    _textInput(hint: "Entrez votre prénom"),
                    _textInput(hint: "Entrez votre Email", icon: Icons.email),
                    _textInput(hint: "Mot de passe", icon: Icons.vpn_key),
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
                      onPressed: () {},
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

  Widget _textInput({controller, hint, icon}) {
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
