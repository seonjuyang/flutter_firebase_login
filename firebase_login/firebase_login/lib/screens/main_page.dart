import 'package:flutter/material.dart';
import 'firebase';
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
            FirebaseLogin.instance.signOut()
          }, child:Text("Logout")))
      ),
    );
  }
}
