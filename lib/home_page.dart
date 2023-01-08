

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/screens/Side_menu.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/nowPlaying.dart';
import 'package:movies_app/widgets/searchMovies.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatelessWidget {
  // String userUID;
  // HomePage({required this.userUID});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List nowplaying = [];
  final String apikey = 'abefe398d9ce981f047e38154771f3e0';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYmVmZTM5OGQ5Y2U5ODFmMDQ3ZTM4MTU0NzcxZjNlMCIsInN1YiI6IjYzYWZmMmI1MjdkOWNjMDBjODY5MzE4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8F-RG8YrSywJgcC6RNzE-WxTTiipTZSh0hOfYF1E1wc';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies() async{
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apikey, readaccesstoken));
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true,
    );
    Map trendingresult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlogs.v3.tv.getPopular();
    Map nowplayingresult =await tmdbwithcustomlogs.v3.movies.getNowPlaying();

    // print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      nowplaying = nowplayingresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: modified_text(text:'Movies App', size: 25 ),
      ),
      drawer:  NavDrawer(),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  SearchMovies(keyword: value);
                },
                cursorColor: Colors.grey[300],
                style: TextStyle(
                  color: Colors.grey[300],
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search_sharp),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ),
          TV(tv: tv,),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
          NowPlaying(nowPlaying: nowplaying),

        ],
      ),
    );
  }
}
