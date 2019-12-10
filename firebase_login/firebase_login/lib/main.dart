import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
      children: <Widget>[
        Container(
          color: Colors.blue,
        ),
        Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.white,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
            ),
          ],
        )
      ],
    )));
  }
}
