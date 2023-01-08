import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
   final _textController =  TextEditingController();

   // @override
   // void dispose(){
   //   _textController.dispose();
   //   super.dispose();
   // }

   Future passwordReset() async{
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _textController.text.trim());
        showDialog(context: context, builder: (context) {
          return AlertDialog(content: Text('Password reset link sent! Check your email.'),);
        },);
      }on FirebaseAuthException catch(e){
        print(e);
        showDialog(context: context, builder: (context) {
          return AlertDialog(content: Text(e.message.toString()),);
        },);
      }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Enter your email id to get password reset link.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 20,
              ),),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 5),
              child: TextField(

                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.grey[200],
                ),
                keyboardType: TextInputType.emailAddress ,
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

            SizedBox(height: 10,),
            MaterialButton(onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.lightBlueAccent,)
          ],
        ),
      ),
    );
  }
}
