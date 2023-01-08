import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class NowPlaying extends StatelessWidget {
  NowPlaying({required this.nowPlaying});
  final List nowPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: modified_text(text:"Now Playing", size: 19,),
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowPlaying.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Description(
                        name: nowPlaying[index]['title']!=null?nowPlaying[index]['title']:"Not Loaded",
                        bannerurl:'https://image.tmdb.org/t/p/w500'+nowPlaying[index]['backdrop_path'] ,
                        posterurl:'https://image.tmdb.org/t/p/w500'+nowPlaying[index]['poster_path'] ,
                        description: nowPlaying[index]['overview']!=null?nowPlaying[index]['overview']:"Not Loaded",
                        vote: nowPlaying[index]['vote_average']!=null?nowPlaying[index]['vote_average'].toString():"Not Loaded",
                        launch_on: nowPlaying[index]['release_date']!=null?nowPlaying[index]['release_date']:"Not Loaded",
                      )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          if(nowPlaying[index]['poster_path']!=null)
                            Container(
                              height:200,

                              decoration: BoxDecoration(image: DecorationImage(

                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+nowPlaying[index]['poster_path']
                                  )
                              )),
                            ),
                          SizedBox(height: 10,),
                          Container(
                            child: modified_text(text: nowPlaying[index]['title']!=null?nowPlaying[index]['title']:"Loading",),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
