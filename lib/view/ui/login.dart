import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t3t3/view/ui/screen_util.dart';

import 'password_recovery.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: _screenUtil.setHeight(300),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: _screenUtil.setWidth(30),
                    left: _screenUtil.setWidth(30),
                    top: _screenUtil.setWidth(20),
                    bottom: _screenUtil.setWidth(20)),
                child: _formField(
                  'Email',
                  Icons.email,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: _screenUtil.setWidth(30),
                    left: _screenUtil.setWidth(30),
                    top: _screenUtil.setWidth(20),
                    bottom: _screenUtil.setWidth(20)),
                child: _formField('Password', Icons.lock,
                    obscureText: true,
                    controller: _passwordController,
                    inputType: TextInputType.text),
              ),
              Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PasswordRecovery()));
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff745d2a),
                        fontSize: _screenUtil.setSp(50),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
//                  Navigator.of(context).pushReplacementNamed('/Home');
                  print('${_emailController.text}');
                  print('${_passwordController.text}');
                },
                title: Padding(
                  padding: EdgeInsets.only(
                      right: _screenUtil.setWidth(30),
                      left: _screenUtil.setWidth(30),
                      top: _screenUtil.setWidth(20),
                      bottom: _screenUtil.setWidth(20)),
                  child: Container(
                    height: _screenUtil.setHeight(150),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(_screenUtil.setHeight(30))),
                      color: Color(0xff9b7448),
                    ),
                    child: Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _screenUtil.setSp(50),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(50)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Don\'t have an account?\nYou can sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff745d2a),
                        fontSize: _screenUtil.setSp(50),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: _screenUtil.setHeight(3),
                      color: Color(0xff745d2a),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Sign in with',
                      style: TextStyle(
                          color: Color(0xff9b7448),
                          fontSize: _screenUtil.setSp(50)),
                      softWrap: false,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: _screenUtil.setHeight(3),
                      color: Color(0xff745d2a),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: _screenUtil.setWidth(90),
                      backgroundImage: AssetImage('assets/facebook_login.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_screenUtil.setWidth(10)),
                    ),
                    CircleAvatar(
                      radius: _screenUtil.setWidth(90),
                      backgroundImage: AssetImage('assets/google_login.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/Home');
          },
          child: Container(
            padding: EdgeInsets.all(_screenUtil.setWidth(50)),
            color: Color(0xff9b7448),
            child: Text(
              'Log in as a guest',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: _screenUtil.setSp(50),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formField(String hintTitle, IconData icon,
      {@required final TextEditingController controller,
      final bool obscureText = false,
      final TextInputType inputType = TextInputType.text}) {
    return Stack(
      children: [
        Container(
          height: _screenUtil.setHeight(120),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: Color(0xfff4f4f8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(_screenUtil.setWidth(30))),
                borderSide: BorderSide.none,
              ),
              hintText: hintTitle,
              contentPadding: EdgeInsets.only(
                  left: _screenUtil.setWidth(100),
                  top: _screenUtil.setHeight(28),
                  bottom: _screenUtil.setHeight(28)),
              hintStyle: TextStyle(
                color: Color(0xffd8cfcc),
                fontSize: _screenUtil.setSp(40),
              ),
            ),
            keyboardType: inputType,
          ),
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          child: Padding(
            padding: EdgeInsets.all(_screenUtil.setWidth(28)),
            child: Icon(
              icon,
              color: Color(0xffd9d9d9),
              size: _screenUtil.setSp(40),
            ),
          ),
        ),
      ],
    );
  }
}
