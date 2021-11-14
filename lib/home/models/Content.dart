class Content {
  int? id;
  String? name;
  String? imageUrl;
  int? tmdb_id;

  Content({this.id, this.name, this.imageUrl, this.tmdb_id});

  @override
  String toString() {
    return '${this.name}';
  }

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      tmdb_id: json['tmdb_id'],
    );
  }
}
