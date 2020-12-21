import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t3t3/bloc/login/login_bloc.dart';
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
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.of(context).pushReplacementNamed('/Home');
          } else if (state is FailedState) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: _screenUtil.setSp(50),
            );
          } else if (state is ErrorState) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: _screenUtil.setSp(50),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  Scaffold(
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
                              if (_emailController.text.trim().isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'Username or email required.',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black54,
                                  textColor: Colors.white,
                                  fontSize: _screenUtil.setSp(50),
                                );
                                return;
                              }

                              if (_passwordController.text.trim().isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'Password required.',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black54,
                                  textColor: Colors.white,
                                  fontSize: _screenUtil.setSp(50),
                                );
                                return;
                              }

                              BlocProvider.of<LoginBloc>(context).add(LoggingIn(
                                  _emailController.text,
                                  _passwordController.text));
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
                                      Radius.circular(
                                          _screenUtil.setHeight(30))),
                                  color: Colors.black26,
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
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
                                  backgroundImage:
                                      AssetImage('assets/facebook_login.png'),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(_screenUtil.setWidth(10)),
                                ),
                                CircleAvatar(
                                  radius: _screenUtil.setWidth(90),
                                  backgroundImage:
                                      AssetImage('assets/google_login.png'),
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
                        color: Colors.black26,
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
                  state is LoggingInState
                      ? Positioned(
                          top: 0.0,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          },
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
