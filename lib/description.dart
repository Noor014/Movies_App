import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class Description extends StatelessWidget {
  final String description , launch_on , vote, bannerurl , posterurl;
  final String? name;
  const Description({Key? key,  this.name, required this.description, required this.launch_on, required this.vote, required this.bannerurl, required this.posterurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
             Container(
               height: 500,
               child: Stack(
                 children: [
                   Positioned(child:Container(
                     width: MediaQuery.of(context).size.width,
                     child: Image.network(bannerurl, fit: BoxFit.contain) ,
                   )),
                   Positioned(bottom: 10,
                       child: modified_text(text: '  ⭐ Average Rating - '+vote , size: 18,))
                 ],
               ),
             ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: modified_text(text: (name!=null)?name!:'Not Loaded', size: 24,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: modified_text(text: 'Release Date : '+launch_on ,  size: 14, ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl) ,
                ),
                Flexible(
                  child: Container(
                    child: modified_text(
                      text: description,
                      size: 18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
