import 'package:movies_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _textController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      // appBar: AppBar(
      //
      //   backgroundColor: Colors.deepPurple,
      //   title: Text('Event Scheduler', textAlign: TextAlign.center,),
      //
      // ),
      backgroundColor: Colors.black87,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/tmdb_logo.jpeg")
                            )
                        ),
                      ),
                      ),

                  Text('Create your account',
                    // textAlign: TextAlign.center,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0), //position of shadow
                          // blurRadius: 6.0, //blur intensity of shadow
                          color: Colors.grey.withOpacity(
                              0.8), //color of shadow with opacity
                        ),

                        //add more shadow with different position offset here
                      ],
                    ),
                  ),

                  //Sign Up Fields
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                    child: TextField(

                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.name ,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        hintText: "Enter your name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _nameController,

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(

                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _textController,

                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: TextField(

                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: _passController,

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height:50, //height of button
                      width:200,
                      child: ElevatedButton(
                          onPressed:()async{
                            try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: _textController.text,
                                password: _passController.text,
                              );

                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

                            }
                            on FirebaseAuthException catch (e) {
                              String error = "";
                              if (e.code == 'weak-password') {
                                error += "The password provided is too weak.";
                              } else if (e.code == 'email-already-in-use') {
                                error += "The account already exists for this email.";
                              }
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Alert"),
                                  content: Text(error),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.lightBlueAccent,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("Ok", style: TextStyle(color: Colors.black ),),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          } ,
                          style: ElevatedButton.styleFrom(
                            elevation: 20,  // Elevation
                            shadowColor: Colors.grey[300], //
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text("Sign Up",
                            style: TextStyle(fontSize: 20),)),
                    ),
                  ),
                ]
            ),
          ),
        ),),
    );
  }
}