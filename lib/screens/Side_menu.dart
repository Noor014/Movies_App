
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/SignInPage.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            
            decoration: BoxDecoration(
                // color: Colors.deepPurple,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/sidecover.jpg'))), child: null,
          ),

          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),


          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));},
          ),
        ],
      ),
    );
  }
}