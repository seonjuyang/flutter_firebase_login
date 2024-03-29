import 'package:firebase_login/data/join_or_login.dart';
import 'package:firebase_login/helper/login_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authpage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(alignment: Alignment.center, children: <Widget>[
      CustomPaint(
        size: size,
        painter:
            LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _logoImage,
          Stack(
            children: <Widget>[
              _inputForm(size),
              _authBotton(size),
            ],
          ),
          Container(
            height: size.height * 0.1,
          ),
          Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => GestureDetector(
                onTap: () {
                  joinOrLogin.toggle();
                },
                child: Text(
                  joinOrLogin.isJoin
                      ? "Already have an Accoount? Sign in!"
                      : "Don't have an Account? Create one!",
                  style: TextStyle(
                      color: joinOrLogin.isJoin ? Colors.red : Colors.blue),
                )),
          ),
          Container(
            height: size.height * 0.05,
          )
        ],
      )
    ]));
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/login.gif"),
            ),
          ),
        ),
      );

  Widget _authBotton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
              child: Text(joinOrLogin.isJoin ? "Join" : "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: joinOrLogin.isJoin ? Colors.red : Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_passwordController.text.toString());
                }
              },
            ),
          ),
        ),
      );

  Widget _inputForm(Size size) => Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12, top: 12, bottom: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (context, value, child) => Opacity(
                        opacity: value.isJoin ? 0 : 1,
                        child: Text("Forgot Password?")),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
