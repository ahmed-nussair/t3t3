import 'package:flutter/material.dart';

import 'screen_util.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();

  final _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: _screenUtil.setHeight(300),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_screenUtil.setWidth(30)),
                          child: _formField(
                            'Enter your email',
                            Icons.email,
                            controller: _emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: _screenUtil.setHeight(150),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(_screenUtil.setHeight(30))),
                                color: Color(0xff9b7448),
                              ),
                              child: Text(
                                'Recover Your Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _screenUtil.setSp(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: _screenUtil.setHeight(30),
              left: _screenUtil.setWidth(30),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: _screenUtil.setSp(70),
                ),
              ),
            ),
          ],
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
