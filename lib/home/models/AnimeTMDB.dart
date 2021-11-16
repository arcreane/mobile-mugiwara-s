// ignore_for_file: file_names

class AnimeTMDB {
  String? poster_path;
  String? backdrop_path;
  int? id;
  num? vote_average;
  String? overview;
  String? name;

  AnimeTMDB(
      {this.poster_path,
      this.backdrop_path,
      this.id,
      this.vote_average,
      this.overview,
      this.name});

  @override
  String toString() {
    return '${this.name}';
  }

  static isNull(var path){
    if(path != null){
      return "https://image.tmdb.org/t/p/original" + path;
    }else{
      return '';
    }
  }

  factory AnimeTMDB.fromJson(Map<String, dynamic> json) {
    return AnimeTMDB(
      id: json['id'],
      name: json['name'],
      poster_path: AnimeTMDB.isNull(json['poster_path']),
      backdrop_path: AnimeTMDB.isNull(json['backdrop_path']),
      vote_average: json['vote_average'],
      overview: json['overview'],
    );
  }
}
