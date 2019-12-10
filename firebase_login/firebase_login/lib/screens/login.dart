import 'package:flutter/material.dart';

class Authpage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration:
                            InputDecoration(icon: Icon(Icons.account_circle)),
                      ),
                      TextFormField(
                        controller: _passwordController,
                      ),
                      Text("Forgot Password?")
                    ],
                  ),
                ),
                // Container(
                //   width: 100,
                //   height: 50,
                //   color: Colors.black,
                // )
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Text("Don't have Account? Create one!"),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }
}
