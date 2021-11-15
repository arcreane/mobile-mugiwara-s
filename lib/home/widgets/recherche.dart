import 'package:flutter/material.dart';

class Topmovies extends StatelessWidget {
  final List topmovies;

  const Topmovies({Key? key, required this.topmovies}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Trending Movies'),
          Container(
            height: 500,
            child: ListView.builder(itemCount: topmovies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
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
                                image: NetworkImage('http://image.tmdb.org/t/p/w500'+topmovies[index]["poster_path"]),
                                )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(topmovies[index]['title']),
                                    margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                    width: 250,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 50),
                                    height:50,
                                    width: 250,
                                    child: Text(topmovies[index]['overview'])
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