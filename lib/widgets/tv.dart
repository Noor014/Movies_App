import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Popular TV Shows', size: 19,),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 250,
                    child: Column(
                      children: [
                        if(tv[index]['backdrop_path']!=null)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20) ,
                                image: DecorationImage(
                                    image: NetworkImage('http://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']),fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),

                        SizedBox(height: 5,),

                        Container(
                          child: modified_text(text: tv[index]['original_name']!=null? tv[index]['original_name']:'Loading'),
                        )
                      ],
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}
