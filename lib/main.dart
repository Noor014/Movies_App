import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/screens/SignInPage.dart';
import 'package:movies_app/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
      // title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                heightFactor: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 320,
                      height: 320,
                      // color: Colors.red,
                      child: Lottie.asset('animation/open_screen.json',repeat: false)
                      ,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      nextScreen: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) =>
        snapshot.hasData? HomePage():SignInPage(),
      ),
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}