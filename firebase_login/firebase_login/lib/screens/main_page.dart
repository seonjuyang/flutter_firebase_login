import 'package:flutter/material.dart';
import 'package:firebase_login/main.dart';
 
class Mainpage extends StatelessWidget {

  MainPage({this.email});
 
 final String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
        ),
      body: Container(
        child:Center(
          child: FlatButton(onPressed: (){
            FirebaseLogin
          }, child:Text("Logout")))
      ),
    );
  }
}
