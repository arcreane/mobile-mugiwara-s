import 'package:flutter/material.dart';
import 'package:mugi/home/models/AnimeTMDB.dart';

class search_anime_result extends StatelessWidget {
  final List<AnimeTMDB> list_anime;

  const search_anime_result({Key? key, required this.list_anime}): super(key: key);

  @override
  Widget build(BuildContext context){
    int nb_resultat = list_anime.length;
    double container_size = MediaQuery.of(context).size.height - 230;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Nombre de resultat : $nb_resultat'),
          Container(
            height: container_size,
            child: ListView.builder(itemCount: list_anime.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                AnimeTMDB anime = list_anime[index];
                if(anime.poster_path == ""){
                  return Container(width: 0,height: 0,);
                }
                return InkWell(
                  onTap: (){
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height:200,
                              width: 100,
                              decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(anime.poster_path!),
                                )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(anime.name!),
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                    width: 250,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 50),
                                    height:50,
                                    width: 250,
                                    child: Text(anime.overview!)
                                  )
                                ],
                              )
                            )
                          ],
                        )
                      ]
                    )
                  ),
                );
              },
            )
          )
        ]
      )
    );
  }
}