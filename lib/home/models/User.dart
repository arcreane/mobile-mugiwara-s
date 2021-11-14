import './Content.dart';

class User {
  int? id;
  String? nom;
  String? prenom;
  String? mail;
  List<Content>? watch_list = [];

  User.empty();

  User({this.id, this.nom, this.prenom, this.mail, this.watch_list});

  @override
  String toString() {
    return '${this.id} - ${this.nom}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      mail: json['mail'],
      watch_list: (json['watch_list'] as List)
          .map((el) => Content.fromJson(el))
          .toList(),
    );
  }
}
